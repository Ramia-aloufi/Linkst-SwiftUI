//
//  UserPostsView.swift
//  Linkst
//
//  Created by ramia n on 22/04/1447 AH.
//

import SwiftUI

struct UserPostsView: View {
    @ObservedObject var viewModel = PostViewModel.shared

    var body: some View {
        VStack{
            switch viewModel.userPosts {
            case .loading:
                ProgressView()
            case .data(let posts):
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(posts, id: \.self) { post in
                            UserPostsCard(post: post)
                        }
                    }
                    .padding()
                }

            case .error(let string):
                DSText(string, color: Color.Error.text)
            case .empty,.idle:
                DSText("No Data")
            }
        }
        .onAppear{
                Task{
                    await viewModel.fetchUserPosts()
                }
            }
       
    }
}

#Preview {
    UserPostsView()
}
