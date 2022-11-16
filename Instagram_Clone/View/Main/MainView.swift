//
//  MainView.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/16.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            FeedView()
            
            SearchView()
            
            UploadPostView()
            
            NotificationsView()
            
            ProfileView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
