//
//  User.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 05/11/2022.
//

import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String

    @DocumentID var id: String?
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
    
    var isFollowed: Bool? = false
    
}
