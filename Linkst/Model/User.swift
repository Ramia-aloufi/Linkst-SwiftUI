//
//  User.swift
//  Linkst
//
//  Created by ramia n on 18/03/1447 AH.
//

import Foundation
struct User: Identifiable, Codable, Equatable,Hashable {
    let id: UUID
    let firstName: String
    let lastName: String
    let email: String
//    let gender: String
    let followers: [UUID]
    let following: [UUID]
    let savedPosts: [UUID]
    let profile: Profile        // adjust type if profile is an object later
    let stories: [Story]
    let posts: [UserPost]
//    let projects: [String]      // adjust if projects has more details
    let fullName: String
}


struct UserPost: Identifiable, Codable, Equatable,Hashable {
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

struct UserInfo: Identifiable, Codable, Equatable,Hashable {
    let id:UUID
    let fullName:String
    let profileImage:String?
}
