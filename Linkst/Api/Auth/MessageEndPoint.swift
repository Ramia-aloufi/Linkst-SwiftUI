//
//  MessageEndPoint.swift
//  Linkst
//
//  Created by ramia n on 15/04/1447 AH.
//

import Foundation
enum MessageEndpoint:Endpoint {    
    case getChatMessage(id:UUID)
    case newMessage(chatId:UUID,message:Data)
    // Dynamic Body type per case
    var body: RequestBody? {
        switch self {
        case .getChatMessage: return nil
        case .newMessage(_,let message): return .raw(message)
        }
    }
    
    var path: String {
        switch self {
        case .getChatMessage(let id): return "/message/chat/\(id)"
        case .newMessage(let id,_) : return "/message/chat/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getChatMessage: return .GET
        case .newMessage: return .POST
            
        }
    }
    
    var headers: [Header] {
        var result: [Header] = [.accept, .jsonContentType]
        
        switch self {
        case .getChatMessage: break
        case .newMessage: result.append(.boundary(boundary: Data.boundary))
        }
        
        // Add Authorization if token exists
        if let token = TokenHelper.token {
            result.append(.authorization(token: token))
        }
        
        return result    }
}
