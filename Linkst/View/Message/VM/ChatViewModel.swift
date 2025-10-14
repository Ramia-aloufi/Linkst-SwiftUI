//
//  ChatViewModel.swift
//  Linkst
//
//  Created by ramia n on 15/04/1447 AH.
//

import Foundation

@MainActor
class ChatViewModel: ObservableObject {
    @Published private(set) var state: AppState<[Chat]> = .loading

    private let service:ChatService
    
    init(service:ChatService=ChatServiceImp()) {
        self.service = service
        Task{ await getAll()}
    }
    
    func getAll() async{
        state = .loading
        do {
            let response = try await service.getAllChat()
            if response.isEmpty {
                state = .empty
            } else {
                state = .data(response)
            }
        } catch let apiError as APIError {
            state = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            state = .error(error.localizedDescription)
        }
        
        
        
    }
}
