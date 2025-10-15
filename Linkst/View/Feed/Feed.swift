//
//  Feed.swift
//  Linkst
//
//  Created by ramia n on 30/03/1447 AH.
//

import SwiftUI

struct Feed: View {
    
    @ObservedObject var viewModel = PostViewModel.shared
    @State private var showNewPost = false
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView("Loading...")
        case .error(let message):
            Text("Error: \(message)")
                .foregroundColor(.red)
        case .empty, .idle:
            Text("No posts available")
        case .data(let response):
            
            NavigationStack {
                List(response.content) { post in
                    PostCard(post: post)
                        .listRowInsets(EdgeInsets())
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Posts")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showNewPost = true
                            
                        }) {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                    }
                    
                }
                .navigationDestination(isPresented: $showNewPost) {
                    NewPost()
                }
            }
            
            
            
        }
    }
}


#Preview {
    Feed()
}
