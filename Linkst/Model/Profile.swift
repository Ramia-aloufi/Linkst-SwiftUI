//
//  Profile.swift
//  Linkst
//
//  Created by ramia n on 18/03/1447 AH.
//

import Foundation
struct Profile:Identifiable,Codable,Hashable,Equatable {
    let id:UUID
    let bio:String?
    let location:String?
    let website:String?
    let profilePictureUrl:String?
    let headerImageUrl:String?
}
