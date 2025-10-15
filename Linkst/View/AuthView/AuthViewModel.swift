//
//  AuthViewModel.swift
//  Linkst
//
//  Created by ramia n on 22/03/1447 AH.
//

import SwiftUI

import SwiftUI

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var state: AppState<AuthResponse> = .empty

    private let service: AuthService
    init(service: AuthService = AuthServiceImp()) {
        self.service = service
    }

    // MARK: - Login
        func login(login: LoginReq) async {
            state = .loading
            do {
                let response = try await service.login(loginRequest: login)
                TokenHelper.token = response.token
                state = .data(response)
            } catch let error as APIError {
                state = .error(error.errorDescription ?? "Something went wrong")
            } catch {
                state = .error("Something went wrong")
            }
        }

        // MARK: - Sign Up
        func signUp(signUp: SignUpReq) async {
            state = .loading
            do {
                let response = try await service.register(signUpRequest: signUp)
                TokenHelper.token = response.token
                state = .data(response)
            } catch let error as APIError {
                state = .error(error.errorDescription ?? "Something went wrong")
            } catch {
                state = .error("Something went wrong")
            }
        }
}

