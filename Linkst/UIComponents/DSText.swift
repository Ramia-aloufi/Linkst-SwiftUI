//
//  DSText.swift
//  Linkst
//
//  Created by ramia n on 29/03/1447 AH.
//

import SwiftUI
/// `DSText` is a reusable text component for your design system.
///
/// Use it to display titles, subtitles, body text, captions, or descriptions
/// consistently across your app.
///
/// Example usage:
/// ```swift
/// DSText("Welcome!", style: .title, color: .blue)
/// DSText("Enter your credentials", style: .description, color: .gray)
/// ```
struct DSText: View {
    private let text: String
    private var font: Font = .body
    private var style: any ShapeStyle
    private var alignment: TextAlignment = .leading
    private var lineLimit: Int? = nil
    private var multilineTextAlignment: TextAlignment? = nil
    
    init(_ text: String, font: Font = .body, color style: some ShapeStyle = Color.primary, alignment: TextAlignment = .leading, lineLimit: Int? = nil, multilineTextAlignment: TextAlignment? = nil) {
        self.text = text
        self.font = font
        self.style = style
        self.alignment = alignment
        self.lineLimit = lineLimit
        self.multilineTextAlignment = multilineTextAlignment
        
    }
    
    var body: some View {
        Text(text)
            .font(font)
            .foregroundStyle(style)
            .lineLimit(lineLimit)
            .multilineTextAlignment(multilineTextAlignment ?? alignment)
    }
}

#Preview {
    DSText("Hello World")
    DSText("Welcome Back!",
           font: .largeTitle,
           color: .blue,
           alignment: .center
    )
    
    DSText("This is a longer description that may wrap into multiple lines.",
           font: .body,
           color: .gray,
           lineLimit: 3
    )
}
