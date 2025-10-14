//
//  ChatWebSocket.swift
//  Linkst
//
//  Created by ramia n on 16/04/1447 AH.
//

import Foundation
import Foundation

import Foundation
import SwiftUI

@MainActor
class ChatWebSocket: ObservableObject {
    @Published var messages: [Message] = []

    private var webSocketTask: URLSessionWebSocketTask?
    private var groupId: String = ""

    func connect(groupId: String) {
        self.groupId = groupId
        let url = URL(string: "ws://localhost:8080/ws")! // your backend WS
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.resume()
        listen()
    }

    private func listen() {
        webSocketTask?.receive { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let message):
                switch message {
                case .data(let data):
                    if let newMessage = try? JSONDecoder().decode(Message.self, from: data) {
                        Task { @MainActor in
                            self.messages.append(newMessage)
                        }                    }
                case .string(let str):
                    if let data = str.data(using: .utf8),
                       let newMessage = try? JSONDecoder().decode(Message.self, from: data) {
                        Task { @MainActor in
                            self.messages.append(newMessage)
                        }                    }
                @unknown default: break
                }
            case .failure(let error):
                print("WebSocket receive error: \(error)")
            }
            self.listen() // keep listening
        }
    }

    func sendMessage(_ message: Message) {
        guard let data = try? JSONEncoder().encode(message),
              let jsonString = String(data: data, encoding: .utf8) else { return }
        
        webSocketTask?.send(.string(jsonString)) { error in
            if let error = error {
                print("WebSocket send error:", error)
            }
        }
    }

    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
}
