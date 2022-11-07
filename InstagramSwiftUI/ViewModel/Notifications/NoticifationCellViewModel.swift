//
//  NoticifationCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 07/11/2022.
//

import Foundation

class NoticifationCellViewModel: ObservableObject {
    
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
        fetchNotificationPost()
        fetchNotificationUser()
    }
    
    var timestampString: String {
        return notification.timestamp.asAbbreviatedString()
    }
    
    func follow() {
        UserService.follow(uid: self.notification.uid) { _ in
            NotificationsViewModel.uploadNotification(toUid: self.notification.uid, type: .follow)
            self.notification.userIsFollowed = true
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: self.notification.uid) { _ in
            self.notification.userIsFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard notification.type == .follow else { return }
        UserService.checkIfUserIsFollowed(uid: self.notification.uid) { isFollowed in
            self.notification.userIsFollowed = isFollowed
        }
    }
    
    
    func fetchNotificationPost() {
        guard let postId = notification.postId else { return }
        COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
            self.notification.post = try? snapshot?.data(as: Post.self)
        }
    }
    
    func fetchNotificationUser() {
        COLLECTION_USERS.document(notification.uid).getDocument { snapshot, _ in
            self.notification.user = try? snapshot?.data(as: User.self)
        }
    }
    
}
