//
//  PostService.swift
//  Linkst
//
//  Created by ramia n on 19/03/1447 AH.
//

import Foundation

protocol PostService {
    
    func allPosts() async throws -> PostResponse
    func getUserPosts() async throws -> [UserPosts]
    func createPost(_ post: Data) async throws -> UserPosts
}

final class PostServiceImp: PostService {
    
    private let client = HTTPClient.shared
    
  
    func allPosts() async throws -> PostResponse {
        let data:PostResponse = try await client.request(PostEndpoint.all)
        print(data)
        return data
    }
    
    func getUserPosts() async throws -> [UserPosts] {
        let data:[UserPosts] = try await client.request(PostEndpoint.userPosts)
        print(data)
        return data
    }
    func createPost(_ post: Data) async throws -> UserPosts {
        let data:UserPosts = try await client.request(PostEndpoint.newPost(post))
        return data
    }
    
}

