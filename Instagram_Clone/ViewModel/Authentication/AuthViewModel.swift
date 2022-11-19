//
//  AuthViewModel.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/19.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    static let shared = AuthViewModel()
    
    func register(withEmail email: String, password: String, username: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            let data = [
                "email": email,
                "username": username,
                "fullname": fullname,
                "uid": user.uid
            ]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                
                print("DEBUG: USER CREATED")
            }
        }
    }
}
