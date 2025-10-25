//
//  StoryBubbleView.swift
//  Linkst
//
//  Created by ramia n on 27/04/1447 AH.
//

import SwiftUI
import Kingfisher

struct StoryBubbleView: View {
    let story: UserStories
    
      var body: some View {
          VStack {
              storyThumbnail
                  .frame(width: 60, height: 60)
                  .clipShape(Circle())
                  .overlay(Circle().stroke(Color.gradient(from: Color.Brand.primary, to: Color.Brand.secondary), lineWidth: 3))
              
              Text(story.user.fullName.truncated(limit: 5))
                  .font(.caption2)
                  .lineLimit(1)
                  .foregroundStyle(Color.Text.secondary)
          }
      }
      
      @ViewBuilder
      private var storyThumbnail: some View {
          switch story.stories[0].mediaType {
          case "image":
              KFImage(URL(string: story.stories[0].media))
                  .placeholder { ProgressView() }
                  .resizable()
                  .scaledToFill()
          case "video":
              if let url = URL(string: story.stories[0].media) {
                  KFImage(source: .provider(AVAssetImageDataProvider(assetURL: url, seconds: 1)))
                      .placeholder { ProgressView() }
                      .resizable()
                      .scaledToFill()
              }
          default:
              Color.gray
          }
      }
  }

#Preview {
//    StoryBubbleView()
}
