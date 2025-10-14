//
//  ChatCard.swift
//  Linkst
//
//  Created by ramia n on 15/04/1447 AH.
//

import SwiftUI
import Kingfisher

struct ChatCard: View {
    let chat: Chat
    
    var body: some View {
        HStack{
            KFImage(URL(string: chat.profileImage))
                .resizable()
                .aspectRatio(11/11, contentMode: .fill)
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            VStack(alignment: .leading){

                DSText(chat.fullName, font: .subtitle)
                DSText(chat.lastMessage ?? "", font: .callout)
            }

        }
    }
}

#Preview {
    ChatCard(chat: Chat(id: UUID(), userId: UUID(), profileImage: "https://res.cloudinary.com/dhrj6nlxm/image/upload/v1760296929/default-avatar-profile-icon-social-600nw-1906669723.jpg_zwbrok.webp", fullName: "User Name", createdAt: Date.now, lastMessage: "hi"))
}
