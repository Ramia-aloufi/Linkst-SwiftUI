//
//  DSTextField.swift
//  Linkst
//
//  Created by ramia n on 27/03/1447 AH.
//

import SwiftUI
//Edit if secure add the image and if email add image directly
public struct DSTextField: View {
    public enum FieldType { case text, email, password }
    
    @Binding private var text: String
    private let placeholder: String
    private let style: Style
    private let size: Size
    private let isDisabled: Bool
    private let type: FieldType
    private let validationMessage: String?
    private let textColor: Color
    private let fieldColor:Color
    @State private var isSecured: Bool
    
    public init(
        _ placeholder: String,
        text: Binding<String>,
        style: Style = .primary,
        size: Size = .medium,
        isDisabled: Bool = false,
        type: FieldType = .text,
        validationMessage: String? = nil
    ) {
        self._text = text
        self.placeholder = placeholder
        self.style = style
        self.size = size
        self.isDisabled = isDisabled
        self.type = type
        self.validationMessage = validationMessage
        self._isSecured = State(initialValue: type == .password)
        self.textColor =  validationMessage != nil ? .Error.text : .errorText
        self.fieldColor = validationMessage != nil ? .Error.text : style.color
       
        
    }

    
    public var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: .sm) {
                Group {
                    switch type {
                    case .password:
                        Image(systemName: "lock")
                            .foregroundColor(Color.Text.tertiary)
                        SecureField(placeholder, text: $text)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .textContentType(.password)
                        
                            Button(action: { isSecured.toggle() }) {
                                Image(systemName: isSecured ? "eye.slash" : "eye")
                                    .foregroundColor(Color.Text.tertiary)
                            }
                    case .email:
                        Image(systemName: "envelope")
                            .foregroundColor(Color.Text.tertiary)
                        TextField(placeholder, text: $text)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                                .textContentType(.emailAddress)
                            
                    case .text:
                        TextField(placeholder, text: $text)
                    }
                }
                .font(size.font)
                .foregroundColor(textColor)
                .disabled(isDisabled)
                
            }
            .padding(.md)
//            .background(Color.Background.surface)
            .clipShape(RoundedRectangle(cornerRadius: .roundedMd))
            .overlay(
                RoundedRectangle(cornerRadius: .roundedMd)
                    .stroke(fieldColor, lineWidth: 1)
            )
            .opacity(isDisabled ? 0.5 : 1)
            
            // Show validation message
            if let message = validationMessage {
                DSText(message,font: .caption2, color: Color.Error.text)
            }
        }
    }
}





#Preview {
    @Previewable @State  var username = ""
    @Previewable @State  var password = ""
    @Previewable @State  var email = ""

    VStack(spacing: .md) {
        DSTextField(
            "Username",
            text: $email,
            validationMessage: email.isValidEmail() ? nil : "Invalid email"
        )
        
        DSTextField(
            "Password",
            text: $password,
            type: .password,
            validationMessage: password.count >= 6 ? nil : "Password too short"
        )
        DSTextField(
            "Email",
            text: $email,
            type: .email    )
    }
    .padding(.lg)
}
