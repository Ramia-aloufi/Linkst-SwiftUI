//
//  Feed.swift
//  Linkst
//
//  Created by ramia n on 30/03/1447 AH.
//

import SwiftUI

struct Feed: View {
    @ObservedObject var viewModel = PostViewModel.shared

    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView("Loading...")
        case .error(let message):
            Text("Error: \(message)")
                .foregroundColor(.red)
        case .empty:
            Text("No posts available")
        case .data(let response):
            DSText("Posts",font: .subtitle)
            List{
                    ForEach(response.content) { post in
                        
                        PostCard(post: post)                        
                }
                    .listRowInsets(EdgeInsets())
            }
            .padding(.vertical)
            .listStyle(PlainListStyle())
        }
    }
}


#Preview {
    Feed()
}
