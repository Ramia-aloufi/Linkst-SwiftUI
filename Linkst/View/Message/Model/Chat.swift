//
//  Chat.swift
//  Linkst
//
//  Created by ramia n on 15/04/1447 AH.
//

import Foundation
struct Chat:Codable,Identifiable,Equatable{
    let id: UUID
    let userId: UUID
    let profileImage: String
    let fullName: String
    let createdAt:Date?
    let lastMessage:String?
}


