//
//  AuthViewModel.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 05/11/2022.
//

import Firebase
import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User? {
        didSet {
            fetchUser()
        }
    }
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error logging user (email: \(email)! \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
        }
    }
    
    func register(withEmail email: String, fullname: String, username: String, password: String, image: UIImage?) {
        guard let image = image else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print("DEBUG: Error creating user! \(error.localizedDescription)")
                    return
                }
                
                guard let user = result?.user else { return }
                print("DEBUG: Successfully registered user...")
                
                let data = [
                    "uid" : user.uid,
                    "email" : email,
                    "username" : username,
                    "fullname" : fullname,
                    "profileImageUrl" : profileImageUrl
                ]
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("DEBUG: Successfully uploaded user data to firestore...")
                    self.userSession = user
                }
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        print("DEBUG: Reset password")
    }
    
    func fetchUser() {
        guard let currentLoggedUserUid = userSession?.uid else { return }
        COLLECTION_USERS
            .document(currentLoggedUserUid)
            .getDocument { snapshot, _ in
                guard let user = try? snapshot?.data(as: User.self) else { return }
                self.currentUser = user
            }
    }
    
}
