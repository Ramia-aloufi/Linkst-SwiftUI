//
//  DSButton.swift
//  Linkst
//
//  Created by ramia n on 26/03/1447 AH.
//

import SwiftUI

public struct DSButton: View {
    
    private let title: String
    private let style: ButtonStyle
    private let size: Size
    private let isLoading: Bool
    private let action: () -> Void
    
    public init(
        _ title: String,
        style: ButtonStyle = .primary,
        size: Size = .medium,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.size = size
        self.isLoading = isLoading
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(0.8)
                }
                Text(title)
                    .font(.title3)
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(style.foregroundColor)
            .padding(size.padding)
            .background(style.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: size.cornerRadius))
        }
        .disabled(isLoading)
        .opacity(isLoading ? 0.5 : 1)
    }
    
}


#Preview {
    @Previewable @State var loading = false

    VStack(spacing: 16) {
        DSButton("Primary", style: .primary, size: .medium, isLoading: loading) {
            loading.toggle()
        }
        
        DSButton("Destructive", style: .destructive, size: .large) {
            print("Deleted")
        }
        
        DSButton("Link", style: .link, size: .small) {
            print("Navigate")
        }
    }
    .padding()}
