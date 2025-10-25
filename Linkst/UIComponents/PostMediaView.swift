//
//  PostMediaView.swift
//  Linkst
//
//  Created by ramia n on 30/03/1447 AH.
//

import SwiftUI
import AVKit

struct PostMediaView: View {
    let mediaURL: String
    let type: String
    let height: CGFloat
    
    var body: some View {
        switch type.lowercased() {
        case "image":
            if let url = URL(string: mediaURL) {
                AsyncImage(url: url) { image in
                    image.resizable()
                         .frame(maxWidth: .infinity)
                         .frame(height: height)
                         .clipped()
                         .cornerRadius(10)
                } placeholder: {
                    Color.gray.opacity(0.3)
                        .frame(maxWidth: .infinity)
                        .frame(height: height)
                        .cornerRadius(10)
                        .clipped()

                }
            } else {
                Color.gray.opacity(0.3)
                    .frame(height: height)
                    .cornerRadius(10)
            }
            
        case "video":
            if let url = URL(string: mediaURL) {
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(maxWidth: .infinity)
                    .frame(width: .infinity, height: height)
                    .cornerRadius(10)
                    .clipped()
            } else {
                Color.black
                    .frame(maxWidth: .infinity)
                    .frame(width: .infinity, height: height)
                    .cornerRadius(10)
            }
            
        default:
            Color.gray.opacity(0.3)
                .frame(maxWidth: .infinity) 
                .frame(width: .infinity, height: height)
                .cornerRadius(10)
        }
    }
}

#Preview {
    PostMediaView(mediaURL: "https://res.cloudinary.com/dhrj6nlxm/video/upload/v1756474649/posts/f030dcf6-713d-43b4-b8bf-f7f663b96bea_6562012-uhd_3840_2160_25fps.mp4.mp4", type: "video", height: 250)
}

