//
//  ImageUploader.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 05/11/2022.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        ref.putData(imageData) { storageMetadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image! \(error)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageURL = url?.absoluteString else { return }
                print("DEBUG: Successfully uploaded image with url: \(imageURL)")
                completion(imageURL)
            }
            
        }
        
    }
    
}
