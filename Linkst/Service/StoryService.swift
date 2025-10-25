//
//  StoryService.swift
//  Linkst
//
//  Created by ramia n on 25/04/1447 AH.
//

import Foundation
protocol StoryService{
    func getLatestStory() async throws -> [UserStories]
}
final class StoryServiceImp: StoryService {
    
    private let client = HTTPClient.shared
    
    func getLatestStory() async throws -> [UserStories] {
        let data:[UserStories] = try await client.request(StoryEndpoint.latest)
        return data
    }
    
    
    
}
