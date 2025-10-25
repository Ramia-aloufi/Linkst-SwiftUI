//
//  PostActionsView.swift
//  Linkst
//
//  Created by ramia n on 30/03/1447 AH.
//

import SwiftUI


struct PostActionsView: View {
    let likeCount: Int
    let commentCount: Int
    let isLiked: Bool
    let onLike: (() -> Void)?
    let onComment: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 30) {
            // Like Button
            Button(action: {
               
            }) {
                HStack(spacing: 2) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .primary)
                    if likeCount > 0 {
                        DSText("\(likeCount)",font: .body, color: .textPrimary)
                    }
                }
            }
                
                // Comment Button
                Button(action: {
                    onComment?()
                }) {
                    HStack(spacing: 5) {
                        Image(systemName: "bubble.right")
                            .foregroundColor(.primary)
                        if commentCount > 0 {
                            DSText("\(commentCount)",font: .body, color: .textPrimary)
                        }
                        
                    }
                }
                
                Spacer()
            }
            .padding(.vertical, 5)
        }
    }


#Preview {
    VStack(spacing: 20) {
               // Example: not liked, some likes and comments
               PostActionsView(
                   likeCount: 12,
                   commentCount: 4,
                   isLiked: false,
                   onLike: { print("Liked!") },
                   onComment: { print("Comment tapped!") }
               )
               
               // Example: liked, more likes and comments
               PostActionsView(
                   likeCount: 102,
                   commentCount: 30,
                   isLiked: true,
                   onLike: { print("Liked!") },
                   onComment: { print("Comment tapped!") }
               )
           }
           .padding()
       }
