//
//  TokenHelper.swift
//  Linkst
//
//  Created by ramia n on 23/04/1447 AH.
//

import Foundation


enum TokenHelper {
    static var token: String? {
        get { UserDefaults.standard.string(forKey: Config.token) }
        set { UserDefaults.standard.set(newValue, forKey: Config.token) }
    }
}
