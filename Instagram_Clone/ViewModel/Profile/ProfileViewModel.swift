//
//  ProfileViewModel.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/21.
//

import SwiftUI
import Firebase
import FirebaseStorage

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func changeProfileImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        guard let uid = user.id else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageURL in
            Firestore.firestore().collection("users").document(uid).updateData(["profileimageURL": imageURL]) { err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
            }
        }
    }
}
