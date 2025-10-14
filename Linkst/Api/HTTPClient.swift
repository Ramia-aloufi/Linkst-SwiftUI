//
//  HTTPClient.swift
//  Linkst
//
//  Created by ramia n on 22/03/1447 AH.
//

import Foundation

final class HTTPClient {
    static let shared = HTTPClient()
    private init() {}
    private var baseURL: URL = URL(string: "http://localhost:8080")!
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }()
    
    func request<E: Endpoint,R: Decodable>(_ endpoint: E) async throws -> R {
        let url = baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        // Headers
        let allHeaders = endpoint.headers.reduce(into: [String: String]()) { result, header in
            result.merge(header.value) { $1 }
        }
        request.allHTTPHeaderFields = allHeaders
        
        // Body
        if let body = endpoint.body {
            switch body {
            case .encodable(let encodable):
                let jsonData = try JSONEncoder().encode(encodable)
                request.httpBody = jsonData
                
                if request.value(forHTTPHeaderField: "Content-Type") == nil {
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                }
                
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print("JSON Body: \(jsonString)")
                }
                
            case .raw(let data):
                request.httpBody = data
                // Content-Type must already be in headers (e.g., multipart with boundary)
                print("Raw Body (size: \(data.count) bytes)")
            }
        }
        
        // Perform request
        let (data, response) = try await URLSession.shared.data(for: request)
        if let jsonString = String(data: data, encoding: .utf8) {
            print(jsonString)
        } else {
            print("Failed to decode data as UTF-8 string")
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        // Handle empty response gracefully
        if data.isEmpty, 200..<300 ~= httpResponse.statusCode {
            // Return a dummy empty object if E.Response can be empty, otherwise throw
            throw APIError.emptyResponse
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return try decoder.decode(R.self, from: data)
            
        case 401:
            TokenManager.shared.token = nil
            throw APIError.unauthorized
            
        case 403:
            TokenManager.shared.token = nil
            throw APIError.forbidden
            
        default:
            // Try structured server error first
            if let errorResponse = try? decoder.decode(ErrorResponse.self, from: data) {
                throw APIError.serverError(errorResponse)
            }
            // Fallback to raw string
            if let rawMessage = String(data: data, encoding: .utf8), !rawMessage.isEmpty {
                throw APIError.serverMessage(rawMessage)
            }
            throw APIError.httpStatus(code: httpResponse.statusCode)
        }
    }
}
