//
//  FeedCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 06/11/2022.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        checkIfPostIsLiked()
    }
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    func like() {
        guard let postId = post.id else { return }
        guard let currentUserUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_POSTS.document(postId).collection("post-likes").document(currentUserUid).setData([:]) { _ in
            COLLECTION_USERS.document(currentUserUid).collection("user-likes").document(postId).setData([:]) { _ in
                COLLECTION_POSTS.document(postId).updateData(
                    ["likes" : self.post.likes + 1]
                )
                
                NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
                
                self.post.didLike = true
                self.post.likes += 1
            }
        }
    }
    
    func unlike() {
        guard post.likes > 0 else { return }
        guard let postId = post.id else { return }
        guard let currentUserUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(currentUserUid)
            .delete { _ in
                COLLECTION_USERS.document(currentUserUid).collection("user-likes").document(postId)
                    .delete { _ in
                        COLLECTION_POSTS.document(postId).updateData(
                            ["likes" : self.post.likes - 1]
                        )
                        
                        
                        
                        self.post.didLike = false
                        self.post.likes -= 1
                    }
            }
    }
    
    func checkIfPostIsLiked() {
        guard let postId = post.id else { return }
        guard let currentUserUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(currentUserUid).collection("user-likes").document(postId).getDocument { snapshot, error in
            if let error = error {
                print("DEBUG: Error getting info about post from Firestore: \(error)")
                return
            }
            guard let didLike = snapshot?.exists else { return }
            self.post.didLike = didLike
        }
    }
}

