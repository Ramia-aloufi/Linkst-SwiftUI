//
//  Reels.swift
//  Linkst
//
//  Created by ramia n on 18/03/1447 AH.
//

import Foundation


struct Reels: Codable,Identifiable,Hashable {
    let id:UUID
    let title:String
    let createdAt:Date?
    let videoUrl:String
    let user:UserProfile
}
struct UserProfile:Codable,Identifiable,Equatable,Hashable{
        let profile:ProfileImage?
        let id:UUID
        let fullName:String
}
struct ProfileImage :Codable,Equatable,Hashable{
    let profilePictureUrl:String
    
}

