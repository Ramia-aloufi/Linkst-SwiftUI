//
//  APIError.swift
//  Linkst
//
//  Created by ramia n on 27/03/1447 AH.
//

import Foundation
//enum APIError: Error, LocalizedError {
//    case networkError(Error)          // e.g., no internet
//    case invalidResponse              // status code not in 200...299
//    case decodingError(Error)         // JSON decode failed
//    case serverError(ErrorResponse)   // API returned an error payload
//    case unknown
//
//    var errorDescription: String? {
//        switch self {
//        case .networkError(let error):
//            return "Network error: \(error.localizedDescription)"
//        case .invalidResponse:
//            return "Invalid server response."
//        case .decodingError(let error):
//            return "Failed to decode data: \(error.localizedDescription)"
//        case .serverError(let response):
//            return "Server error: \(response.message)"
//        case .unknown:
//            return "An unknown error occurred."
//        }
//    }
//}

import Foundation

enum APIError: LocalizedError {
    case invalidResponse
    case unauthorized           // 401
    case forbidden              // 403
    case httpStatus(code: Int)  // Other HTTP errors
    case serverError(ErrorResponse)
    case serverMessage(String)
    case emptyResponse          // No data returned

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response from server."
        case .unauthorized:
            return "Unauthorized access. Please login again."
        case .forbidden:
            return "You do not have permission to perform this action."
        case .httpStatus(let code):
            return "HTTP Error with code: \(code)"
        case .serverError(let errorResponse):
            return errorResponse.message
        case .serverMessage(let message):
            return message
        case .emptyResponse:
            return "No data returned from server."
        }
    }
}


struct ErrorResponse: Codable, Error {
    let message: String
    //    let error: String?
    //    let timestamp: Date?
    //}
}
