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
    
    func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            print(user)
        }
    }
}
