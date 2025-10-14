//
//  MessagesView.swift
//  Linkst
//
//  Created by ramia n on 16/04/1447 AH.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct MessagesView: View {
    @StateObject var viewModel: MessagesViewModel = .init()
    @StateObject var ws = ChatWebSocket()
    
    @State var message: String = ""
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil

    let chatId: UUID
    
    var body: some View {
        VStack{
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .error(let error):
                Text("Error: \(error)")
            case .empty:
                Text("No messages yet")
            case .data(let messages):
                ScrollViewReader { proxy in
                    List{
                        ForEach(messages, id: \.self){ message in
                            MessagesCard(message: message)
                        }
                        .listRowSeparator(.hidden)
                        .padding(.horizontal, 8)

                    }
                    .listStyle(.plain)
                    .onAppear {
                        if let lastId = messages.last?.id {
                            proxy.scrollTo(lastId, anchor: .bottom)
                        }
                    }
                    .onChange(of: messages) {_, _ in
                        if let lastId = messages.last?.id {
                            withAnimation {
                                proxy.scrollTo(lastId, anchor: .bottom)
                            }
                        }
                    }
                }

                HStack {
                    // Media picker
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Image(systemName: "photo.badge.plus.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .onChange(of: selectedItem) { _, newValue in
                        Task {
                            if let data = try? await newValue?.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                selectedImage = uiImage
                            }
                        }
                    }
                    
                    DSTextField("write message", text: $message)

                    // Send button (enabled only if there's text or image)
                    Button {
                        var parameters:[String:String] = [:]
                        if !message.isEmpty {
                                parameters["content"] = message
                        }
                        let files: [String: UploadFile]? = {
                            if let uploadFile = selectedImage {
                                return ["image": .image(uploadFile)]
                            } else {
                                return nil
                            }
                        }()
                        let body = Data.createMultipartFormData(parameters: parameters, files:files)
                       Task{
                           if let bodyString = String(data: body, encoding: .utf8) {
                               print("Multipart Body:\n\(bodyString)")
                           }
                               await viewModel.sendMessage(chatId: chatId, data: body)
                        }
                        selectedImage = nil
                        message = ""
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor((message.isEmpty && selectedImage == nil) ? .gray : .blue)
                            .font(.system(size: 24))
                    }
                    .disabled(message.isEmpty && selectedImage == nil)
                }
                .overlay(alignment: .bottomTrailing) {
                    if let image = selectedImage {
                        ImagePreview(image: image) {
                            selectedItem = nil
                            selectedImage = nil
                        }
                    }
                }


                .padding(.horizontal)

            }
        }
        .task{
                await viewModel.getChatMessages(chatId: chatId)
            }
//        .onAppear {
//            ws.connect(groupId: chatId.uuidString)
//               }
//               .onDisappear {
//                   ws.disconnect()
//               }


    }
}

#Preview {
    MessagesView(chatId: UUID(uuidString: "198e2a80-6f0e-4de5-a034-b311fefb9607") ?? UUID())
}
