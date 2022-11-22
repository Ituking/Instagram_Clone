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
}

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images\(filename)")
        
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