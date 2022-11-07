//
//  User.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 05/11/2022.
//

import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String

    @DocumentID var id: String?
    var stats: UserStats?
    var bio: String? = ""
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
    
    var isFollowed: Bool? = false
    
}


struct UserStats: Decodable {
    var posts: Int
    var following: Int
    var followers: Int
}
