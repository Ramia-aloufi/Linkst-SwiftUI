//
//  ReelsEndpoint.swift
//  Linkst
//
//  Created by ramia n on 14/04/1447 AH.
//

import Foundation
enum ReelsEndpoint:Endpoint {
    
    case getAll

    var body: RequestBody? {
        switch self {
        case .getAll: return nil
        }
    }
    
    var path: String {
        switch self {
        case .getAll: return "/reels/getAll"
        }
    }
    
    var method: HTTPMethod { .GET }
    var headers: [Header] {
        var result: [Header] = [.accept, .jsonContentType]
        
        // Add Authorization if token exists
        if let token = TokenManager.shared.token {
            result.append(.authorization(token: token))
        }
        
        return result    }
}
