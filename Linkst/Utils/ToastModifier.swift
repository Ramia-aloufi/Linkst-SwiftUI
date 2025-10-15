//
//  ToastModifier.swift
//  Linkst
//
//  Created by ramia n on 23/04/1447 AH.
//

import Foundation
import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let message: String
    var backgroundColor: Color = .green

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                VStack {
                    Spacer()
                    Text(message)
                        .padding()
                        .background(backgroundColor.opacity(0.85))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 50)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                .animation(.easeInOut, value: isPresented)
            }
        }
    }
}

extension View {
    func toast(isPresented: Binding<Bool>, message: String, backgroundColor: Color = .green) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, backgroundColor: backgroundColor))
    }
}
