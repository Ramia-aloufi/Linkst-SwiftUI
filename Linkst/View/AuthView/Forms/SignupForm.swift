//
//  SignupForm.swift
//  Linkst
//
//  Created by ramia n on 26/03/1447 AH.
//

import SwiftUI

struct SignupForm: View {
    @ObservedObject var vm: AuthViewModel
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    private var isValid: Bool {
        !email.isEmptyOrWhitespace && !password.isEmptyOrWhitespace
    }


    var body: some View {
        VStack(spacing: 16){
            DSText("SignUp",font: .headline)

            
            HStack{
                DSTextField("firstName", text: $firstName)
                DSTextField("lastName", text: $lastName)
            }
                DSTextField("Email", text: $email,type: .email)
                DSTextField("password", text: $password,type: .password)
                DSButton("SignUp", style: .primary, size: .medium,isLoading: vm.state.isLoading) {
                    let inputData = LoginReq(email: email, password: password)
                    Task {
                        await vm.login(login: inputData)
                    }
                }



            
            
        }.padding(.horizontal,32)
    }
}

#Preview {
    @Previewable @StateObject var vm = AuthViewModel()
    SignupForm(vm: vm)
}
