//
//  ViewEx.swift
//  Linkst
//
//  Created by ramia n on 02/05/1447 AH.
//

import Foundation
import SwiftUICore
extension View {
    func GradientText() -> some View {
        self.foregroundStyle(
            LinearGradient(
                colors: [Color.Brand.primary, Color.Brand.secondary],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}
