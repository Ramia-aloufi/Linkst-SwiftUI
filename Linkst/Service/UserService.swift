//
//  UserService.swift
//  Linkst
//
//  Created by ramia n on 16/04/1447 AH.
//

import Foundation
protocol UserService{
    
    func getProfile()async throws -> User
    
}
final class UserServiceImp: UserService {
    private let client = HTTPClient.shared

    func getProfile() async throws -> User {
        let data:User = try await client.request(UserEndpoint.getMe)
        return data
    }
    
    
}
