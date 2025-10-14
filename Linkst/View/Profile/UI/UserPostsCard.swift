//
//  UserPostsCard.swift
//  Linkst
//
//  Created by ramia n on 22/04/1447 AH.
//

import SwiftUI

struct UserPostsCard: View {
    let post: UserPosts
    var body: some View {
        VStack{
            if let media = post.media , !media.isEmpty,let type = post.type {
                PostMediaView(mediaURL: media, type:type, height: 200)
                    .clipped()
            }
            else {
                DSText(post.content,lineLimit: 1)
                    .overlay(content: {
                        Rectangle().stroke(Color.gray, lineWidth: 0.5)
                            .frame(width: .infinity,height: 200)
                    })
            }
            

        }
    }
}

#Preview {
    UserPostsCard(post: UserPosts(
        id: UUID(), caption: "",
        content: "",
        media: "https://res.cloudinary.com/dhrj6nlxm/image/upload/v1755174011/posts/fc5efac5-dafc-4ce9-9350-f568dc909777_abstract-background-with-patterned-glass-texture.jpg.jpg",
        type: "image",
        likes: [],
        comments: [],
        createdAt: Date.now,
        updatedAt: Date.now))
}
