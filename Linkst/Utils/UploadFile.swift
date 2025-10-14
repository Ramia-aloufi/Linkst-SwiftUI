//
//  UploadFile.swift
//  Linkst
//
//  Created by ramia n on 19/04/1447 AH.
//

import Foundation
import UIKit
enum UploadFile {
    case image(UIImage)
    case video(URL)
    
    var mimeType: String {
        switch self {
        case .image(_):
            return "image/jpeg"
        case .video(_):
            return "video/mp4"
        }
    }
    
    var fileExtension: String {
        switch self {
        case .image(_):
            return "jpg"          
        case .video(_):
            return "mp4"
        }
    }
    
    var data: Data? {
        switch self {
        case .image(let img):
            return img.jpegData(compressionQuality: 0.8)
        case .video(let url):
            return try? Data(contentsOf: url)
        }
    }
}

