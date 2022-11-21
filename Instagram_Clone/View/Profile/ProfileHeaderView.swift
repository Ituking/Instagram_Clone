//
//  ProfileHeaderView.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/16.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @State private var userImage: Image?
    @State var imagePickerRepresented = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("ted")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading, 16)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStats(value: 1363, title: "Posts")
                    UserStats(value: 1363, title: "Followers")
                    UserStats(value: 1363, title: "Following")
                }
                .padding(.trailing, 32)
            }
            
            Text(AuthViewModel.shared.currentUser?.fullname ?? "")
                .font(.system(size: 15, weight: .bold))
                .padding([.leading, .top])
            
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
