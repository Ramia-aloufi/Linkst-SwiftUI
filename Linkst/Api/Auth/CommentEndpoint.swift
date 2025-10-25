//
//  CommentEndpoint.swift
//  Linkst
//
//  Created by ramia n on 29/04/1447 AH.
//

import Foundation

enum CommentEndpoint: Endpoint {
    case getAllComments(postId: UUID)
    case createComment(postId: UUID, comment: String)
    var path:String{
        switch self {
        case .createComment(let postId, _): return "/posts/\(postId)/comments"
        case .getAllComments(postId: let postId): return "/posts/\(postId)/comments"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .createComment(postId: _, comment: _): return .POST
        case .getAllComments(postId: _): return .GET
        }
    }
    
    var headers: [Header]{
        var result: [Header] = []
        if let token = TokenHelper.token {
            result.append(.authorization(token:token))
        }
        return result
    }
    
    var body: RequestBody?{
        switch self {
        case .createComment(postId: _, comment: let comment):
            return .encodable(comment)
        case .getAllComments: return nil
        }
    }
    
    var queryItems: [URLQueryItem]? {nil}
    
    
}
