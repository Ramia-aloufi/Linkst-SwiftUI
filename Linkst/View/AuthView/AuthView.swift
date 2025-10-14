//
//  AuthView.swift
//  Linkst
//
//  Created by ramia n on 26/03/1447 AH.
//

import SwiftUI
//add environment Auth VM use it her and on login signup
struct AuthView: View {
    
    @StateObject var vm: AuthViewModel = AuthViewModel()
    @State var showSignUp: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Image("logo")
                    .resizable()
                    .frame(width: 30,height: 40)
 
                Text("LINKST")
                    .font(.system(size: 30, weight: .bold, design: .default))
            }.padding()
            Spacer()
            switch showSignUp {
            case true:
                SignupForm(vm:vm)
            default:
                LoginForm(vm:vm)
            }
            switch vm.state {
            case .loading:
                EmptyView()
            case .data(let data):
                Text(data.message)
                    .foregroundColor(.green)
            case .error(let err):
                Text(err)
                    .foregroundColor(.red)
            case .empty:
                EmptyView()
            }
            
            DSText(!showSignUp ? "Don't have an account? Sign up": "Already have an account? Login",font: .body,color: .gray)
                .onTapGesture {
                    self.showSignUp.toggle()
                }
                .padding(.vertical,32)
            

            Spacer()
            
        }
    }
}

#Preview {
    AuthView()
}
