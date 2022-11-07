//
//  EditProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 07/11/2022.
//

import Foundation

class EditProfileViewModel: ObservableObject {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserBio(_ bio: String, completion: @escaping () -> Void) {
        guard let userUid = user.id else { return }
        COLLECTION_USERS.document(userUid).updateData(["bio" : bio]) { _ in
            self.user.bio = bio
            completion()
        }
    }
    
}
