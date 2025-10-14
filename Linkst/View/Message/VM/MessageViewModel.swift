//
//  MessageViewModel.swift
//  Linkst
//
//  Created by ramia n on 15/04/1447 AH.
//

import Foundation
class MessagesViewModel: ObservableObject {
    @Published var state: AppState<[Message]>
    
    
    private var service: MessagesService!
    
    init(service: MessagesService = MessagesServiceImpl()) {
        self.state = .loading
        self.service = service
    }
    
    func getChatMessages(chatId:UUID)async {
        state = .loading
        do{
            let responce = try await service.getMessages(chatId: chatId)
            print(responce)
            if responce.count > 0{
                state = .data(responce)
            }else{
                state = .empty
            }
        } catch let apiError as APIError {
            state = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            state = .error(error.localizedDescription)
        }
        
    }
    
    func sendMessage(chatId:UUID,data:Data)async {
        do {
            if let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                for (key, value) in dict {
                    print("KEY: \(key), VALUE: \(value)")
                }
            }
            let response = try await service.sendMessage(data, to: chatId)
            print(response)
            switch state {
                    case .data(let currentData):
                        state = .data(currentData + [response])
                    default:
                        state = .data([response])
                    }
        } catch let apiError as APIError {
            state = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}

