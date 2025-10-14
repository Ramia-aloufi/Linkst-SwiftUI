//
//  HeaderValue.swift
//  Linkst
//
//  Created by ramia n on 22/03/1447 AH.
//

import Foundation


enum Header {
    case accept
    case jsonContentType
    case authorization(token: String)
    case boundary(boundary: String)
    case formDataContentType

    var value: [String: String] {
        switch self {
        case .accept: return ["Accept": "application/json"]
        case .jsonContentType: return ["Content-Type": "application/json"]
        case .authorization(let token): return ["Authorization": "Bearer \(token)"]
        case .boundary(let boundary): return ["Content-Type": "multipart/form-data; boundary=\(boundary)"]
        case .formDataContentType: return ["Content-Type": "multipart/form-data"]
        }
    }
}


