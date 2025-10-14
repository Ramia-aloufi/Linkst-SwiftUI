//
//  AuthService.swift
//  Linkst
//
//  Created by ramia n on 22/03/1447 AH.
//

import Foundation

protocol AuthService {
    func login(loginRequest: LoginReq) async throws -> AuthResponse
    func register(signUpRequest: SignUpReq) async throws -> AuthResponse
}
final class AuthServiceImp: AuthService {
    private let client = HTTPClient.shared

    func login(loginRequest: LoginReq) async throws -> AuthResponse {
        return try await client.request(AuthEndpoint.login(loginRequest))
    }
    
    func register(signUpRequest: SignUpReq) async throws -> AuthResponse {
        return try await client.request(AuthEndpoint.signup(signUpRequest))
    }
}
