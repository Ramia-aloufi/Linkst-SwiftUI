//
//  AppColor.swift
//  Linkst
//
//  Created by ramia n on 27/03/1447 AH.
//

import Foundation
import SwiftUICore
extension Color {
    struct Brand {
        static let primary       = Color("Primary")
        static let secondary     = Color("Secondary")
        static let Accent        = Color("Accent")
    }

    struct Background {
        static let base    = Color("Base")
        static let surface = Color("Surface")
        static let overlay = Color("Overlay")
    }
    
    struct Text {
        static let primary   = Color("TextPrimary")
        static let secondary = Color("TextSecondary")
        static let tertiary  = Color("TertiaryText")
    }
    
    struct Info {
        static let card   = Color("InfoCard")
        static let text  = Color("InfoText")
    }
    
    struct Error {
        static let card   = Color("ErrorCard")
        static let text  = Color("ErrorText")
    }
    
    struct Success {
        static let card   = Color("SuccessCard")
        static let text  = Color("SuccessText")
    }
    
    struct Warning {
        static let card   = Color("WarningCard")
        static let text  = Color("WarningText")
    }
    
}
