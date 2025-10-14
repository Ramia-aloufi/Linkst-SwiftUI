//
//  Message.swift
//  Linkst
//
//  Created by ramia n on 15/04/1447 AH.
//

import Foundation
struct Message: Codable, Identifiable, Hashable ,Equatable {
    let id: UUID
    let content: String?
    let image: String?
    let user: MessageUser
    let timestamp: Date?
}

struct MessageUser: Codable, Identifiable, Hashable ,Equatable{
    let id: UUID
    let profileImage: String?
    let fullName: String
}
