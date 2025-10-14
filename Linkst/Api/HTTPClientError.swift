//
//  HTTPClientError.swift
//  Linkst
//
//  Created by ramia n on 22/03/1447 AH.
//

import Foundation
enum HTTPClientError: Error {
    case invalidResponse
    case decodingError(Error)
    case clientError(statusCode: Int, data: Data)
    case serverError(statusCode: Int)
    case unknown
}
