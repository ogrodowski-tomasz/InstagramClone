//
//  UserService.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 05/11/2022.
//

import Firebase

typealias FirestoreCompletion = ((Error?) -> Void)?

struct UserService {
    
    static func follow(uid: String, completion: FirestoreCompletion) {
        guard let currentUserUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_FOLLOWING
            .document(currentUserUid)
            .collection("user-following")
            .document(uid)
            .setData([:]) { _ in
                COLLECTION_FOLLOWERS
                    .document(uid)
                    .collection("user-followers")
                    .document(currentUserUid)
                    .setData([:], completion: completion)
            }
    }
    
    static func unfollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUserUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_FOLLOWING
            .document(currentUserUid)
            .collection("user-following")
            .document(uid)
            .delete { _ in
                COLLECTION_FOLLOWERS
                    .document(uid)
                    .collection("user-followers")
                    .document(currentUserUid)
                    .delete(completion: completion)
            }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let isFollowed = snapshot?.exists else { return }
                completion(isFollowed)
            }

    }
    
}
