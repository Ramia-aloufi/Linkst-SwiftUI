//
//  ChatView.swift
//  Linkst
//
//  Created by ramia n on 15/04/1447 AH.
//

import SwiftUI

struct ChatView: View {
    @StateObject var vm: ChatViewModel = ChatViewModel()

    var body: some View {
        switch vm.state {
        case .loading:
            Text("Loading...")
        case .error(let error):
            Text("Error: \(error)")
        case .data(let data):
            NavigationStack
            {
                List {
                    ForEach(data) { item in
                        NavigationLink(destination: MessagesView(chatId:item.id), label: {
                            ChatCard(chat: item)
                        })
                    }                    
                }.listStyle(.plain)
                    .navigationTitle(Text("Chats"))
                    .navigationBarTitleDisplayMode(.inline)

            }

        case .empty:
            Text("empty")
        }
    }
}

#Preview {
    ChatView()
}
