//
//  FeedViewModel.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 06/11/2022.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]() 
    
    init() {
        fetchPosts()
    }
    
    private func fetchPosts() {
        COLLECTION_POSTS.getDocuments { snapshot, error in
            if let error = error {
                print("DEBUG: Error fetch feedView posts: \(error)")
                return
            }
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap { try? $0.data(as: Post.self) }
        }
    }
    
}
