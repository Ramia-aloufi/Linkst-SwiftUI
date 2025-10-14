//
//  ReelsViewModel.swift
//  Linkst
//
//  Created by ramia n on 14/04/1447 AH.
//

import Foundation

@MainActor
class ReelsViewModel: ObservableObject {
    
    @Published private(set) var state: AppState<[Reels]> = .loading
    private let service:ReelsService
    
    init(service:ReelsService = ReelsServiceImp()) {
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
    


    
}
