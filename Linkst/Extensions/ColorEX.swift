//
//  ColorEX.swift
//  Linkst
//
//  Created by ramia n on 26/03/1447 AH.
//

import Foundation
import SwiftUICore
extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        
        self.init(.sRGB, red: r, green: g, blue: b, opacity: opacity)
    }
        static func gradient(from: Color, to: Color) -> LinearGradient {
            LinearGradient(colors: [from, to], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    

}


