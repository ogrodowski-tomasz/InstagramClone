//
//  ImageUploader.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 05/11/2022.
//

import FirebaseStorage
import UIKit

enum UploadType {
    case profile
    case post
    
    var imageStroagePath: StorageReference {
        let fileName = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(fileName)")
        }
    }
}

struct ImageUploader {
    
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let path = type.imageStroagePath
        
        path.putData(imageData) { storageMetadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image! \(error)")
                return
            }
                        
            path.downloadURL { url, error in
                if let error {
                    print("DEBUG: Error getting url for put image: \(error)")
                }
                guard let imageURL = url?.absoluteString else { return }
                print("DEBUG: Successfully uploaded image with url: \(imageURL)")
                completion(imageURL)
            }
            
        }
        
    }
    
}
