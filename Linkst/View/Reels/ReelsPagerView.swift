//
//  ReelsPagerView.swift
//  Linkst
//
//  Created by ramia n on 14/04/1447 AH.
//

import SwiftUI
import AVKit

struct ReelsPagerView: View {
    let reels: [Reels]
    @State private var scrollPosition: UUID?  = nil
    var player:AVPlayer = AVPlayer()
    var body: some View {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0){
                    ForEach(reels.indices, id: \.self) { idx in
                        ReelsCard(
                            reels: reels[idx],
                            player:player
                        )
                        .id(reels[idx].id)
                        .onAppear{
                            scrollPosition = reels[idx].id
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .ignoresSafeArea()
            .scrollTargetBehavior(.paging)
            .onAppear{player.play()}
            .scrollPosition(id:$scrollPosition)
            .onChange(of: scrollPosition) { oldValue, newValue in
                print("Scroll Position Changed: \(String(describing: scrollPosition))")
                scrollTo(id: newValue)
                print("New Value: \(String(describing: newValue))")
            }
            .padding(.bottom,3)
    }

    func scrollTo(id: UUID?) {
    guard let currentPost = reels.first(where: {$0.id == id}) else { return }
    player.replaceCurrentItem(with: nil)
    let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
    player.replaceCurrentItem(with: playerItem)
}
}

#Preview {
    @Previewable @State var reels = [Reels(id: UUID(), title: "Early Meeting", createdAt: Date(), videoUrl: "https://res.cloudinary.com/dhrj6nlxm/video/upload/v1756321861/reels/27c9c9e7-909e-4183-bd43-69767f2d92e7_6562012-uhd_3840_2160_25fps.mp4.mp4", user: UserProfile(profile: ProfileImage(profilePictureUrl: "https://res.cloudinary.com/dhrj6nlxm/image/upload/v1756320817/profile/pictures/3b5904e5-186a-477e-882b-67979f20dbf3_pexels-imjimmyqian-2076596.jpg.jpg"), id: UUID(), fullName: "Mohammed_Ahmad"))]
    ReelsPagerView(reels: reels)
}
