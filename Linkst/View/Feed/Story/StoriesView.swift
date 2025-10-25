//
//  StoriesView.swift
//  Linkst
//
//  Created by ramia n on 25/04/1447 AH.
//

import SwiftUI
import Kingfisher

struct StoriesView: View {
    
    @ObservedObject var viewModel: StoryViewModel = StoryViewModel.shared
    @State var stories:[UserStories] =  []
    @State var isStorySelected: Bool = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack{
                ForEach(stories, id: \.self) { story in
                    if story.stories.first != nil {
                        StoryBubbleView(story: story)
                            .onTapGesture {
                                viewModel.setSelectedStory(story.stories)
                                isStorySelected = true
                            }
                    }
                }
                
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchStories()
                stories = viewModel.state.value ?? []
            }
        }
        .fullScreenCover(isPresented: $isStorySelected)  {
            StoryDetailView()
        }
    }
}
#Preview {
    StoriesView()
}
