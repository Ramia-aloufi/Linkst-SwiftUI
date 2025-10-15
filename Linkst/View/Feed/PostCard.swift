//
//  PostCard.swift
//  Linkst
//
//  Created by ramia n on 30/03/1447 AH.
//

import SwiftUI

import SwiftUI
import AVKit

struct PostCard: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // User Info
            HStack(spacing: 10) {
                UserAvatar(user: post.user, size: 40)
                DSText("@\(post.user.fullName)",font: .callout)
            }
            
            DSText((post.caption != nil ? post.caption : post.content) ?? "" , font: .body)
            if let media = post.media,let type = post.type{
                PostMediaView(mediaURL: media, type: type, height: 200)
                PostActionsView(
                    likeCount: post.likeCount,
                    commentCount: post.commentCount,
                    isLiked: post.likedByCurrentUser,
                    onLike: {
                        print("Liked post ")
                    },
                    onComment: {
                        print("Comment tapped on post")
                    }
                )
        }
        }
        .padding(8)
        .cornerRadius(12)
    }
}



#Preview {
    let sampleUser = UserData(
        userId: UUID(uuidString: "aec79def-f381-4714-abd4-91f197f2b91e")!,
        fullName: "Mohammed Ahmed",
        profilePictureUrl: nil
    )

    // Sample post
    let samplePost = Post(
        id: UUID(uuidString: "335d9f73-cbec-4d16-8543-06c5ac3bde4e")!,
        caption: nil,
        content: """
    Creating Minimalist UI Designs
    Explore the principles of minimalist UI design and how to create clean, user-friendly interfaces that delight users.
    """,
        media: "https://res.cloudinary.com/dhrj6nlxm/video/upload/v1756474649/posts/f030dcf6-713d-43b4-b8bf-f7f663b96bea_6562012-uhd_3840_2160_25fps.mp4.mp4",
        type: "video",
        createdAt: ISO8601DateFormatter().date(from: "2025-08-29T16:37:31.034996")!,
        likeCount: 0,
        commentCount: 0,
        likedByCurrentUser: false,
        user: sampleUser
    )
    PostCard(post: samplePost)
}
