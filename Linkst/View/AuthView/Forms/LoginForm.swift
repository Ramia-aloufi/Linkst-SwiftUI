//
//  LoginForm.swift
//  Linkst
//
//  Created by ramia n on 26/03/1447 AH.
//

import SwiftUI
//
struct LoginForm: View {
    @ObservedObject var vm: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading: Bool = true
    
    private var isValid: Bool {
        !email.isEmptyOrWhitespace && !password.isEmptyOrWhitespace
    }


    var body: some View {
        VStack(spacing: 16){
            
            DSText("Welcome back",font: .headline,color: Color.gradient(from: .Brand.primary, to: .Brand.secondary))

            DSText("Sign in to your account",font: .body,color: Color.Text.secondary)
                .padding(.bottom,.lg)
                DSTextField("Email", text: $email,type: .email)
                DSTextField("password", text: $password,type: .password)
            DSButton("Login", style: .primary, size: .medium,isLoading: vm.state.isLoading) {
                    let inputData = LoginReq(email: email, password: password)
                    Task {
                        await vm.login(login: inputData)
                    }
                }
        }
        .padding(.horizontal,32)
    }
}

#Preview {
    @Previewable @State var vm = AuthViewModel()
    LoginForm(vm: vm)
}
//
