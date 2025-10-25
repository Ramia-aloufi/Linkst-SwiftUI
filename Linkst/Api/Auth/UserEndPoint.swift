//
//  UserEndPoint.swift
//  Linkst
//
//  Created by ramia n on 16/04/1447 AH.
//

import Foundation
enum UserEndpoint:Endpoint {
    
    case getMe
    case search(String)

    var body: RequestBody? {
        switch self {
        case .getMe: return nil
        case .search: return nil
        }
    }
    
    var path: String {
        switch self {
        case .getMe: return "/user/profile"
        case .search: return "/user/search"
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
    var queryItems: [URLQueryItem]?{
        switch self {
            case .search(let text):
            return [URLQueryItem(name: "query", value: text)]
        default:
            return nil
        }
    }

}
