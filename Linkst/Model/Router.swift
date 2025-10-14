//
//  Router.swift
//  Linkst
//
//  Created by ramia n on 26/03/1447 AH.
//

import Foundation

enum Router:Hashable{
    case home
    case reels
    case profile(userName:String)
    case search(query:String)
    case message
}
