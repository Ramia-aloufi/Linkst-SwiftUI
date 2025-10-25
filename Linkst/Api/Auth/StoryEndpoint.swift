//
//  StoryEndpoint.swift
//  Linkst
//
//  Created by ramia n on 25/04/1447 AH.
//

import Foundation

enum StoryEndpoint: Endpoint {
    case latest
    var path: String{
        switch self {
        case .latest:"/story/latest"
        }
    }
    
    var method: HTTPMethod{.GET}
    
    var headers: [Header]{
        var headers: [Header] = [.jsonContentType]
        if(TokenHelper.token != nil){
            headers.append(.authorization(token: TokenHelper.token!))
        }
        return headers
    }
    
    var body: RequestBody?{nil}
    
    var queryItems: [URLQueryItem]?{nil}
    
   
}
