//
//  TokenManager.swift
//  Linkst
//
//  Created by ramia n on 29/03/1447 AH.
//

import Foundation
final class TokenManager {
    static let shared = TokenManager()
    private init() {}
    
    var token: String? {
        get { UserDefaults.standard.string(forKey: "token") }
        set { UserDefaults.standard.set(newValue, forKey: "token") }
    }
}
