//
//  MessagesCard.swift
//  Linkst
//
//  Created by ramia n on 16/04/1447 AH.
//

import SwiftUI
import Kingfisher

struct MessagesCard: View {
    @ObservedObject var userVM = UserViewModel.shared
       let message: Message
       
       var body: some View {
           VStack(alignment: userVM.me?.id == message.user.id ? .leading : .trailing) {
               if let imageURL = message.image {
                   KFImage(URL(string: imageURL))
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 100, height: 100)
                       .clipShape(RoundedRectangle(cornerRadius: 8))
               }
               if let content = message.content , !content.isEmpty {
                   DSText(message.content!)
               }
           }
           .padding(8)
           .background(userVM.me?.id == message.user.id ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
           .cornerRadius(8)
           .frame(maxWidth: .infinity, alignment: userVM.me?.id == message.user.id ? .leading : .trailing)
       }
   }

#Preview {
    MessagesCard(message: Message(id: UUID(), content: "hi", image: "https://res.cloudinary.com/dhrj6nlxm/image/upload/v1752511976/d1otdeleg2lzmsdm4i2i.jpg", user: MessageUser(id: UUID(),profileImage: "",fullName: ""), timestamp: Date.now))
//        .environmentObject(userVM)
    
    
}
