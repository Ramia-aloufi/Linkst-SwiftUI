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
        case .primary: return .Primary
        case .secondary: return .Secondary
        case .error: return .Error
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
            case .primary: return .Primary
            case .secondary: return .Secondary
            case .destructive: return .Error
            case .ghost, .link: return .clear
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .primary, .secondary: return .TextPrimary
            case .destructive: return .white
            case .ghost: return .TextSecondary
            case .link: return .Accent
            }
        }
    }
    
