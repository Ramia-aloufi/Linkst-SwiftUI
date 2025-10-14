//
//  UserViewModel.swift
//  Linkst
//
//  Created by ramia n on 16/04/1447 AH.
//

import Foundation
@MainActor
class UserViewModel:ObservableObject{
    @Published var state:AppState<User> = .loading
    @Published private(set) var me:User? = nil
    
    private var service:UserService!
    
    init(service:UserService = UserServiceImp()){
        self.service = service
        Task {
            await self.getProfile()
        }
    }
    
    func getProfile()async{
        state = .loading
        do{
            let response = try await service.getProfile()
            if response.id.uuidString.isEmpty {
                state = .empty
            } else {
                state = .data(response)
                me = response
            }
        } catch let apiError as APIError {
            state = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    func isCurrentUser(_ senderId: UUID) -> Bool {
        print(me?.id ?? "nil")
        return senderId == me?.id
    }
}
