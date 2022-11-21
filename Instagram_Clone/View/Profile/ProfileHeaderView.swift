//
//  ProfileHeaderView.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/16.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    @State private var userImage: Image? = Image("profile-placeholder")
    @State var selectedImage: UIImage?
    @State var imagePickerRepresented = false
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    if let imageURL = viewModel.user.profileimageURL {
                        KFImage(URL(string: imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding(.leading, 16)
                    } else {
                        Button {
                            self.imagePickerRepresented.toggle()
                        } label: {
                            userImage?
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                        }
                        .sheet(isPresented: $imagePickerRepresented, onDismiss: loadImage, content: {
                            ImagePicker(image: $selectedImage)
                        })
                    }
                }
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStats(value: 1363, title: "Posts")
                    UserStats(value: 1363, title: "Followers")
                    UserStats(value: 1363, title: "Following")
                }
                .padding(.trailing, 32)
            }
            
            Text(viewModel.user.fullname ?? "")
                .font(.system(size: 15, weight: .bold))
                .padding([.leading, .top])
                .padding(.leading, 24)
            
        }
    }
}

extension ProfileHeaderView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        userImage = Image(uiImage: selectedImage)
        viewModel.changeProfileImage(image: selectedImage) { (_) in
            print("DEBUG: Uploaded Image")
        }
    }
}
