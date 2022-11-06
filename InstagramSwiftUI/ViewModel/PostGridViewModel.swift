//
//  PostGridViewModel.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 06/11/2022.
//

import Foundation

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .explore:
            fetchExplorePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorePosts() {
        COLLECTION_POSTS.getDocuments { snapshot, error in
            if let error {
                print("DEBUG: Error fetching posts: \(error)")
                return
            }
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap { try? $0.data(as: Post.self) }
        }
    }
    
    func fetchUserPosts(forUid uid: String) {
        COLLECTION_POSTS
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments { snapshot, error in
                if let error {
                    print("DEBUG: Error fetching (\(uid))'s posts: \(error)")
                    return
                }
                guard let documents = snapshot?.documents else { return }
                self.posts = documents.compactMap { try? $0.data(as: Post.self) }
            }
    }
    
}
