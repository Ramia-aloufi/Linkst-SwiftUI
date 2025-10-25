//
//  UserStories.swift
//  Linkst
//
//  Created by ramia n on 25/04/1447 AH.
//

import Foundation
struct UserStories:Codable,Hashable{
    let user:UserInfo
    let stories:[Story]
}
