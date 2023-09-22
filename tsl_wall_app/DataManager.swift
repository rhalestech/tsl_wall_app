//
//  DataManager.swift
//  tsl_wall_appTests
//
//  Created by Ruben Hales on 9/27/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class DataManager: ObservableObject {
    
    private var db = Firestore.firestore()
    
    // Properties related to post management
    @Published var posts: [Post] = []

    // Fetch posts from Firestore
    func fetchPosts() {
        db.collection("Posts").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.posts = querySnapshot!.documents.compactMap { document in
                    var post = try? document.data(as: Post.self)
                    post?.id = document.documentID
                    return post
                }
            }
        }
    }

    // Add a new post to Firestore
    func addPost(postBreed: String) {
        let randomId = Int.random(in: 1...10000)
        
        db.collection("Posts").addDocument(data: [
            "breed": postBreed,
            "id": randomId
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.fetchPosts() // Refresh posts after adding a new one
            }
        }
    }
}
