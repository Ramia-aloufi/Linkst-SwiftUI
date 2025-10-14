//
//  Story.swift
//  Linkst
//
//  Created by ramia n on 17/04/1447 AH.
//

import Foundation
struct Story: Identifiable, Codable, Equatable,Hashable {
    let id: UUID
    let caption: String
    let media: String
    let mediaType: String
    let createdAt: Date
}
