//
//  SearchCard.swift
//  Linkst
//
//  Created by ramia n on 24/04/1447 AH.
//

import SwiftUI
import Kingfisher

struct SearchCard: View {
    let users: [UserInfo]

        var body: some View {
            NavigationStack {
                List(users, id: \.self) { user in
                    VStack {
                        if let url = URL(string: user.profileImage ?? "https://via.placeholder.com/150") {
                            KFImage(url)
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                        }
                        Text(user.fullName)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
                .navigationTitle("Search")
            }
        }
    }

#Preview {
    SearchCard(users: [
        UserInfo(id: UUID(), fullName: "Lamar Aloufi", profileImage: "https://res.cloudinary.com/dhrj6nlxm/image/upload/v1755074584/profile/pictures/e21da0b7-e800-4017-befa-4e5617874c6c_pexels-moh-adbelghaffar-771742.jpg.jpg")
    ])
}

