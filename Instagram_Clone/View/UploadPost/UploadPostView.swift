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
    @State var ImagePickerRepresented = false
    
    var body: some View {
        
        Button(action: {
            self.ImagePickerRepresented.toggle()
        }, label: {
            Image(systemName: "plus.circle")
                .resizable()
                .scaledToFill()
                .frame(width: 180, height: 180)
                .clipped()
                .padding(.top)
                .foregroundColor(.black)
        })
        .sheet(isPresented: $ImagePickerRepresented) {
            loadImage()
        } content: {
            ImagePicker(image: $selectedImage)
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        postImage = Image(uiImage: selectedImage)
    }
}
