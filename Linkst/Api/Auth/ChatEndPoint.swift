//
//  ChatEndPoint.swift
//  Linkst
//
//  Created by ramia n on 15/04/1447 AH.
//

import Foundation
enum ChatEndpoint:Endpoint {
    case getAll
    case createChat(content :String)

    var body: RequestBody? {
        switch self {
        case .getAll: return nil
        case .createChat(let chat): return .encodable(chat)
            
        }
    }
    
    var path: String {
        switch self {
        case .getAll: return "/chat/all"
        case .createChat : return "/chat/create"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAll: return .GET
        case .createChat: return .POST
            
        }
    }
    
    var headers: [Header] {
        var result: [Header] = [.accept, .jsonContentType]
        
        // Add Authorization if token exists
        if let token = TokenManager.shared.token {
            result.append(.authorization(token: token))
        }
        
        return result    }
}
