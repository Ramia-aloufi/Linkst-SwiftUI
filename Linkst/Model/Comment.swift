//
//  Comment.swift
//  Linkst
//
//  Created by ramia n on 18/03/1447 AH.
//

import Foundation
struct Comment: Identifiable, Codable,Equatable,Hashable {
    let id: UUID
    let comment: String
    let user: User
    let createdAt: Date
}
