//
//  ReelsViewModel.swift
//  Linkst
//
//  Created by ramia n on 14/04/1447 AH.
//

import Foundation

@MainActor
class ReelsViewModel: ObservableObject {
    
    static let shared = ReelsViewModel()
    
    @Published private(set) var state: AppState<[Reels]> = .idle
    @Published private(set) var userReels: AppState<[Reels]> = .idle

    private let service:ReelsService
    
    private init(service:ReelsService = ReelsServiceImp()) {
        self.service = service
        Task { await getAll() }
    }
    
    func getAll() async {
        state = .loading
        do {
            let response = try await service.getAllReels()
            if response.isEmpty {
                state = .empty
            } else {
                state = .data(response)
            }
            print("Fetched reels:", response)
        } catch let apiError as APIError {
            state = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    func getUserReels(userId:UUID) async {
        userReels = .loading
        do {
            let response = try await service.getUserReels(userId: userId)
            if response.isEmpty {
                userReels = .empty
            } else {
                userReels = .data(response)
            }
        } catch let apiError as APIError {
            state = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            state = .error(error.localizedDescription)
        }        }
    }
    
