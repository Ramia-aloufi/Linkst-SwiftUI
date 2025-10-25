//
//  VideoThumbnailView.swift
//  Linkst
//
//  Created by ramia n on 26/04/1447 AH.
//

import SwiftUI

struct VideoThumbnailView: View {
    let url: URL
    @State private var thumbnail: UIImage?
    
    var body: some View {
        ZStack {
            if let thumbnail = thumbnail {
                Image(uiImage: thumbnail)
                    .resizable()
                    .scaledToFill()
            } else {
                ProgressView()
                    .task {
                        thumbnail = await generateThumbnail(from: url)
                    }
            }
            Image(systemName: "play.circle.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .shadow(radius: 4)
        }
        .frame(width: 100, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


#Preview {
    //    VideoThumbnailView()
}
