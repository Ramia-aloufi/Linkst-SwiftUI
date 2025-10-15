//
//  UserReelsCard.swift
//  Linkst
//
//  Created by ramia n on 22/04/1447 AH.
//

import SwiftUI

struct UserReelsCard: View {
    let reels: Reels
    var body: some View {
        PostMediaView(mediaURL: reels.videoUrl, type:"video", height: 200)
            .clipped()
    }
}

#Preview {
    UserReelsCard(reels: Reels(id: UUID(), title: "", createdAt: Date.now, videoUrl: "https://res.cloudinary.com/dhrj6nlxm/video/upload/v1755955266/reels/72a36c14-e381-4ee4-ad2c-40229031e3ea_14235938_2160_3840_50fps.mp4.mp4", user: UserProfile(profile: nil, id: UUID(), fullName: "")))
}

