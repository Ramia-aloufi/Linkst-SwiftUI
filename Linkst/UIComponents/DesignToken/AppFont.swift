//
//  AppFont.swift
//  Linkst
//
//  Created by ramia n on 26/03/1447 AH.
//

import Foundation
import SwiftUI

struct AppFont {
    // Font names (from Info.plist → UIAppFonts)
    struct Name {
        static let bold      = "Montserrat-Bold"
        static let semiBold  = "Montserrat-SemiBold"
        static let regular   = "Montserrat-Regular"
        static let medium    = "Montserrat-Medium"
        static let light     = "Montserrat-Light"
    }
    
    // Base font sizes
    struct Size {
        static let xs: CGFloat  = 4
        static let sm: CGFloat  = 8
        static let md: CGFloat  = 16
        static let lg: CGFloat  = 24
        static let xl: CGFloat  = 32
        static let xxl: CGFloat = 48
    }
}

extension Font {
    // MARK: - Headings
    static let largeTitle  = Font.custom(AppFont.Name.bold, size: AppFont.Size.xxl, relativeTo: .largeTitle)
    static let headline    = Font.custom(AppFont.Name.semiBold, size: AppFont.Size.xl, relativeTo: .title)
    static let subheadline = Font.custom(AppFont.Name.semiBold, size: AppFont.Size.lg, relativeTo: .title2)
    
    // MARK: - Body / Text
    static let body     = Font.custom(AppFont.Name.regular, size: AppFont.Size.md, relativeTo: .body)
    static let subtitle = Font.custom(AppFont.Name.semiBold, size: AppFont.Size.md, relativeTo: .callout)
    
    // MARK: - Small / Footnote / Caption
    static let footnote = Font.custom(AppFont.Name.light, size: AppFont.Size.sm, relativeTo: .footnote)
    static let caption  = Font.custom(AppFont.Name.light, size: AppFont.Size.sm, relativeTo: .caption)
    static let small    = Font.custom(AppFont.Name.regular, size: AppFont.Size.xs, relativeTo: .caption)
    
    // MARK: - Titles
    static let title    = Font.custom(AppFont.Name.bold, size: AppFont.Size.lg, relativeTo: .title)
}

