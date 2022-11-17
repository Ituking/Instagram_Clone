//
//  RegisterView.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/17.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Image("instagram-text-logo")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 220)
                .foregroundColor(.black)
            
            VStack(spacing: -16) {
                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                    .padding()
                .padding(.horizontal, 32)
                
                CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "envelope")
                    .padding()
                    .padding(.horizontal, 32)
                
                HStack {
                    
                    Spacer()
                    
                    Text("Forgot Password")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.gray)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
            }
            
            Button(action: {
                
            }, label: {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            })
            
            Spacer()
            
            HStack {
                Text("Don't have an account?")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Sign In")
                    .font(.system(size: 14))
            }
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
