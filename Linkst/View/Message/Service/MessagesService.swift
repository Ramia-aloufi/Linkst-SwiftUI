//
//  MessagesService.swift
//  Linkst
//
//  Created by ramia n on 16/04/1447 AH.
//

import Foundation

protocol MessagesService {
    func getMessages(chatId:UUID) async throws -> [Message]
    func sendMessage(_ message: Data, to chatId: UUID) async throws -> Message
}

final class MessagesServiceImpl: MessagesService {
    
    
    private let client = HTTPClient.shared

    func getMessages(chatId: UUID)async throws -> [Message] {
        let data:[Message] = try await client.request(MessageEndpoint.getChatMessage(id: chatId))
        return data
    }
    func sendMessage(_ message: Data, to chatId: UUID) async throws -> Message {
        let data:Message = try await client.request(MessageEndpoint.newMessage(chatId: chatId, message: message))
        print("SendMessage")
        print(data)
        return data
    }
}
