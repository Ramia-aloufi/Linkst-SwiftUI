//
//  Utlis.swift
//  Linkst
//
//  Created by ramia n on 27/03/1447 AH.
//

import Foundation
import SwiftUI
public enum Style {
    case primary
    case secondary
    case error
    
    var color: Color {
        switch self {
        case .primary: return .primary.opacity(0.30)
        case .secondary: return .secondary
        case .error: return .Error.text
        }
    }
}


public enum Size {
    case small
    case medium
    case large
    
    var font: Font {
        switch self {
        case .small: return .caption
        case .medium: return .body
        case .large: return .title3
        }
    }
    var padding: CGFloat {
            switch self {
            case .small: return .sm
            case .medium: return .md
            case .large: return .lg
            }
        }
        
        var cornerRadius: CGFloat {
            switch self {
            case .small: return .roundedSm
            case .medium: return .roundedMd
            case .large: return .roundedLg
            }
        }
}


public enum ButtonStyle {
        case primary, secondary, destructive, ghost, link
        
        var backgroundColor: Color {
            switch self {
            case .primary: return .Brand.primary
            case .secondary: return .Brand.secondary
            case .destructive: return .Error.text
            case .ghost, .link: return .clear
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .primary, .secondary: return .Text.primary
            case .destructive: return .white
            case .ghost: return .Text.secondary
            case .link: return .Brand.Accent
            }
        }
    }
    
