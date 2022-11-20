//
//  User.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/20.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    let username: String
    let email: String
    let fullname: String
    let profileimageURL: String
    @DocumentID var id: String?
}
