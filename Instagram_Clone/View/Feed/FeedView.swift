//
//  FeedView.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/16.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel: FeedViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post)
                }
            }
        }
    }
}
