//
//  AppFont.swift
//  Linkst
//
//  Created by ramia n on 26/03/1447 AH.
//

import Foundation
import SwiftUICore
struct AppFont {
    // Font names (from Info.plist → UIAppFonts)
    static let Bold      = "Montserrat-Bold"
    static let SemiBold  = "Montserrat-SemiBold"
    static let Regular   = "Montserrat-Regular"
    static let Medium    = "Montserrat-Medium"
    static let Light     = "Montserrat-Light"
    
    // Sizes
    static let xs: CGFloat  = 4
    static let sm: CGFloat  = 8
    static let md: CGFloat  = 16
    static let lg: CGFloat  = 24
    static let xl: CGFloat  = 32
    static let xxl: CGFloat = 48
}

extension Font {
    static let largeTitle  = Font.custom(AppFont.Bold, size: AppFont.xxl)      // 48
    static let headline    = Font.custom(AppFont.SemiBold, size: AppFont.xl)   // 32
    static let subheadline = Font.custom(AppFont.SemiBold, size: AppFont.lg)   // 24
    static let footnote    = Font.custom(AppFont.Light, size: AppFont.sm)      // 8
    static let small       = Font.custom(AppFont.Regular, size: AppFont.xs)    // 4
    
    static let title    = Font.custom(AppFont.Bold, size: AppFont.lg)       // 24
    static let subtitle = Font.custom(AppFont.SemiBold, size: AppFont.md)   // 16
    static let body     = Font.custom(AppFont.Regular, size: AppFont.md)    // 16
    static let caption  = Font.custom(AppFont.Light, size: AppFont.sm)      // 8
}
