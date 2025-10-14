//
//  ChatService.swift
//  Linkst
//
//  Created by ramia n on 15/04/1447 AH.
//

import Foundation

protocol ChatService {
    func getAllChat() async throws -> [Chat]
}
final class ChatServiceImp: ChatService {
    
    private let client = HTTPClient.shared
    
    func getAllChat() async throws -> [Chat] {
        let data:[Chat] = try await client.request(ChatEndpoint.getAll)
        return data
    }
}
