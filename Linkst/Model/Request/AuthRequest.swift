//
//  AuthRequest.swift
//  Linkst
//
//  Created by ramia n on 27/03/1447 AH.
//

import Foundation
struct LoginReq: Codable {
    var email: String
    var password: String
}

struct SignUpReq: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var gender:Gender
}
enum Gender: String, Codable {
    case male = "male"
    case female = "female"
}
