//
//  NotificationsViewModel.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 06/11/2022.
//

import Firebase
import SwiftUI

class NotificationsViewModel: ObservableObject {
    
    @Published var notifications = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    private func fetchNotifications() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").order(by: "timestamp", descending: true)
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.notifications = documents.compactMap { try? $0.data(as: Notification.self) }
        }

    }
    
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard uid != user.id else { return }
        
        var data = [
            "timestamp" : Timestamp(date: Date()),
            "username" : user.username,
            "uid" : user.id ?? "",
            "profileImageUrl" : user.profileImageUrl,
            "type" : type.rawValue
        ] as [String : Any]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
    
}
