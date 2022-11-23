//
//  FeedViewModel.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/24.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchPosts() {
        Firestore.firestore().collection("posts").getDocuments { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
        }
    }
}
