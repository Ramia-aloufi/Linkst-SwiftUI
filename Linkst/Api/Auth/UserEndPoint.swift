//
//  UserEndPoint.swift
//  Linkst
//
//  Created by ramia n on 16/04/1447 AH.
//

import Foundation
enum UserEndpoint:Endpoint {
    
    case getMe

    var body: RequestBody? {
        switch self {
        case .getMe: return nil
        }
    }
    
    var path: String {
        switch self {
        case .getMe: return "/user/profile"
        }
    }
    
    var method: HTTPMethod { .GET }
    var headers: [Header] {
        var result: [Header] = [.accept, .jsonContentType]
                if let token = TokenHelper.token {
            result.append(.authorization(token: token))
        }
        
        return result
    }
}
