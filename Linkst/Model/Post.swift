//
//  Post.swift
//  Linkst
//
//  Created by ramia n on 18/03/1447 AH.
//

import Foundation
struct UserPosts: Identifiable, Codable,Hashable {
    let id: UUID
    let caption: String?
    let content: String
    let media: String?
    let type: String?
    let likes: [User]
    let comments: [Comment]
    let createdAt: Date
    let updatedAt: Date
}

