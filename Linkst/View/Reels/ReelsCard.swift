//
//  ReelsCard.swift
//  Linkst
//
//  Created by ramia n on 14/04/1447 AH.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI
import Kingfisher

struct ReelsCard: View {
    let reels: Reels
    let player: AVPlayer
    
    init(reels: Reels, player: AVPlayer) {
        self.reels = reels
        self.player = player
    }
    
    var body: some View {
        ZStack{
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal,.vertical])                
            VStack(){
                Spacer()
                HStack(alignment: .center ,spacing:12){
                    KFImage(URL(string: reels.user.profile?.profilePictureUrl ?? ""))
                        .fade(duration: 0.25)
                        .placeholder {
                            ProgressView()
                        }
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: .infinity))
                    VStack(alignment: .leading){
                        DSText(reels.user.fullName,font: .title3 ,color: .white)
                        DSText(reels.title, font: .body, color: .white)
                    }
                    Spacer()
                }
                .padding()
            }
            
        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            default:
                break
            }
        }
    }
}

#Preview {
    @Previewable @State var reels = Reels(id: UUID(), title: "Early Meeting", createdAt: Date(), videoUrl: "https://res.cloudinary.com/dhrj6nlxm/video/upload/v1756321861/reels/27c9c9e7-909e-4183-bd43-69767f2d92e7_6562012-uhd_3840_2160_25fps.mp4.mp4", user: UserProfile(profile: ProfileImage(profilePictureUrl: "https://res.cloudinary.com/dhrj6nlxm/image/upload/v1756320817/profile/pictures/3b5904e5-186a-477e-882b-67979f20dbf3_pexels-imjimmyqian-2076596.jpg.jpg"), id: UUID(), fullName: "Mohammed_Ahmad"))
    ReelsCard(reels: reels, player: AVPlayer())
    
    
}

