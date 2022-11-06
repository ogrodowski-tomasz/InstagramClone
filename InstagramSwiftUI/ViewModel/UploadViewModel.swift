//
//  UploadViewModel.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 05/11/2022.
//

import Firebase
import SwiftUI

class UploadViewModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage, completion: FirestoreCompletion) {

        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { postImageUrl in
            print("DEBUG IMAGE URL: \(postImageUrl)")
            let data = [
                "caption" : caption,
                "timestamp" : Timestamp(date: Date()),
                "likes" : 0,
                "imageUrl" : postImageUrl,
                "ownerUid" : user.id ?? "",
                "ownerImageUrl" : user.profileImageUrl,
                "ownerUsername" : user.username
            ] as [String : Any]
            
            COLLECTION_POSTS
                .addDocument(data: data, completion: completion)
        }
    }
    
}
