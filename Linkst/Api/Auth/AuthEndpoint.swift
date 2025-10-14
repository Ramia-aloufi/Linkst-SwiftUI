//
//  AuthEndpoint.swift
//  Linkst
//
//  Created by ramia n on 22/03/1447 AH.
//

import Foundation


struct AuthResponse: Decodable {
    let token: String
    let message: String
}


enum AuthEndpoint:Endpoint {    
    case login(LoginReq)
    case signup(SignUpReq)
    
    // Dynamic Body type per case
    var body:  RequestBody? {
        switch self {
        case .login(let req): return .encodable(req)
        case .signup(let req): return .encodable(req)
        }
    }
    
    var path: String {
        switch self {
        case .login: return "/auth/login"
        case .signup: return "/auth/signup"
        }
    }
    
    var method: HTTPMethod { .POST }
    var headers: [Header] { [.jsonContentType] }
}
