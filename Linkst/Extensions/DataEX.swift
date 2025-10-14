//
//  DataEX.swift
//  Linkst
//
//  Created by ramia n on 19/04/1447 AH.
//

import Foundation
import UIKit
import UniformTypeIdentifiers

extension Data {
    static let boundary = "Boundary-\(UUID().uuidString)"

    mutating func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
    
    static func createMultipartFormData(
        parameters: [String: String],
        files: [String: UploadFile]? = nil
    ) -> Data {
        var body = Data()
        
        // Add text parameters
        for (key, value) in parameters {
            body.appendString("--\(boundary)\r\n")
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }
        
        // Add files
        files?.forEach { key, file in
            if let fileData = file.data {
                body.appendString("--\(boundary)\r\n")
                body.appendString(
                    "Content-Disposition: form-data; name=\"\(key)\"; filename=\"upload.\(file.fileExtension)\"\r\n"
                )
                body.appendString("Content-Type: \(file.mimeType)\r\n\r\n")
                body.append(fileData)
                body.appendString("\r\n")
            }
        }
        
        // Closing boundary
        body.appendString("--\(boundary)--\r\n")
        
        return body
    }
}
