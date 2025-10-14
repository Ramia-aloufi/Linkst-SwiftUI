//
//  ReelsService.swift
//  Linkst
//
//  Created by ramia n on 14/04/1447 AH.
//

import Foundation

protocol ReelsService {
    func getAllReels() async throws -> [Reels]
}

final class ReelsServiceImp: ReelsService {
    private let client = HTTPClient.shared
    
    // Fetch all posts
    func getAllReels() async throws -> [Reels] {
        let data: [Reels] = try await client.request(ReelsEndpoint.getAll)
        return data
    }
}
