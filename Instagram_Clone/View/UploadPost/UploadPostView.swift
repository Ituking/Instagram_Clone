//
//  UploadPostView.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/16.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image
    @State var captionText = ""
    
    var body: some View {
        Image(systemName: "plus.circle")
            .resizable()
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipped()
            .padding(.top)
            .foregroundColor(.black)
    }
}
