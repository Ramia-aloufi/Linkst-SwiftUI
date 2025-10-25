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
                List{
                    StoriesView()
                    ForEach(response.content) { post in
                        PostCard(post: post)
                            .padding(.horizontal, 8)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())


                }
                .listStyle(.plain)
                .listRowBackground(Color.red)



                
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
