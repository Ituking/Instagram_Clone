//
//  Post.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/24.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Post {
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageURL: String
    let timestamp: Timestamp
    let ownerImageURL: String
}
