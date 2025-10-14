//
//  PostEndpoint.swift
//  Linkst
//
//  Created by ramia n on 30/03/1447 AH.
//

import Foundation

enum PostEndpoint:Endpoint {
    
    case all
    case userPosts
    case newPost(Data)

    var body: RequestBody? {
        switch self {
        case .all: return nil
        case .userPosts: return nil
        case .newPost(let data): return.raw(data)
        }
    }
    
    var path: String {
        switch self {
        case .all: return "/post/summaries"
        case .userPosts: return "/post/user"
        case .newPost: return "/post/create"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .all: return .GET
        case .userPosts: return .GET
        case .newPost: return .POST
        }
    }
    var headers: [Header] {
        var result: [Header] = [.accept, .jsonContentType]
        // Add Authorization if token exists
        if let token = TokenManager.shared.token {
            result.append(.authorization(token: token))
        }
        
        switch self {
        case .all, .userPosts: break
        case .newPost: result.append(.boundary(boundary: Data.boundary))
        }
        
        
        return result
    }
}





struct PostResponse: Codable {
    let content: [Post]
    let currentPage: Int
    let totalPages: Int
    let totalItems: Int
    let hasNext: Bool
    let hasPrevious: Bool
    let nextPageUrl: String?
    let previousPageUrl: String?
}

// MARK: - Post
struct Post: Codable, Identifiable, Equatable {
    let id: UUID
    let caption: String?
    let content: String
    let media: String
    let type: String
    let createdAt: Date
    let likeCount: Int
    let commentCount: Int
    let likedByCurrentUser: Bool
    let user: UserData
}

struct UserData: Codable,Equatable {    
    let userId: UUID
    let fullName: String
    let profilePictureUrl: String?
}
