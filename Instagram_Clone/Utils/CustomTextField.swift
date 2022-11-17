//
//  CustomTextField.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/17.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(.black)
                    .padding(.leading)
            }
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                    .padding(.trailing, 8)
                
                TextField("", text: $text)
            }
            .padding(.leading)
        }
        .frame(width: 360, height: 50)
        .background(
            ZStack {
                Color(.init(white: 0.9, alpha: 0.7))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.init(white: 0.7, alpha: 0.7)), lineWidth: 1)
                    )
            }
        )
    }
}