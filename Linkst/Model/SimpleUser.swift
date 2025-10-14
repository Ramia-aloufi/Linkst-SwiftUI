//
//  SimpleUser.swift
//  Linkst
//
//  Created by ramia n on 19/04/1447 AH.
//

import Foundation
struct SimpleUser: Codable,Identifiable, Hashable ,Equatable {
    let id: UUID
    let firstName: String
    let lastName: String
    let profile: UserProfile?
    let fullName: String
}
