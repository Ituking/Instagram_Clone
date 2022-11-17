//
//  SignInView.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/17.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        HStack {
            
            Spacer()
            
            Text("Forgot Password")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.gray)
                .padding(.top)
                .padding(.trailing, 28)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
