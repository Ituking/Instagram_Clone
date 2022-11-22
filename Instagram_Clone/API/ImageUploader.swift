//
//  ImageUploader.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

enum uploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images\(filename)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: uploadType, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let ref = type.filePath
        ref.putData(imageData, metadata: nil) { (_, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            ref.downloadURL { (url, err) in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                
                guard let imageURL = url?.absoluteString else { return }
                completion(imageURL)
            }
        }
    }
}
