//
//  Notification.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 06/11/2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    
    var userIsFollowed: Bool? = false
    var post: Post?
    var user: User?
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked Your post."
        case .comment: return " commented Your post."
        case .follow: return " started following You."
        }
    }
}
