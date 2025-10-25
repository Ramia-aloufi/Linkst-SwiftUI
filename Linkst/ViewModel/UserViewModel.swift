//
//  UserViewModel.swift
//  Linkst
//
//  Created by ramia n on 16/04/1447 AH.
//

import Foundation
@MainActor
class UserViewModel:ObservableObject{
    static let shared:UserViewModel = .init()
    @Published var state:AppState<User> = .idle
    @Published private(set) var me:User? = nil
    @Published private(set) var userSearch:AppState<[UserInfo]> = .idle

    private var service:UserService!
    
    private init(service:UserService = UserServiceImp()){
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
    
    func searchUser(text:String) async{
        userSearch = .loading
        guard !text.isEmpty else { return }
        do {
            let response = try await service.usersSearch(query: text)
            if response.isEmpty{
                userSearch = .empty
            } else {
                userSearch = .data(response)
            }
        } catch let apiError as APIError {
            userSearch = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            userSearch = .error(error.localizedDescription)
        }
    }
}
