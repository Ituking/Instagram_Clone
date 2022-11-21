//
//  ProfileViewModel.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func changeProfileImage(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let ref = Storage.storage().reference(withPath: "/profile_images")
        
        ref.putData(imageData, metadata: nil) { (_, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
        }
    }
}
