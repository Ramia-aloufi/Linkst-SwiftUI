//
//  UserAvatar.swift
//  Linkst
//
//  Created by ramia n on 30/03/1447 AH.
//

import SwiftUI

import SwiftUI

struct UserAvatar: View {
    let user: UserData
    let size: CGFloat

    var initials: String {
        let names = user.fullName.split(separator: " ")
        let first = names.first?.first.map { String($0) } ?? ""
        let second = names.dropFirst().first?.first.map { String($0) } ?? ""
        return (first + second).uppercased()
    }

    var body: some View {
        if let profileUrl = user.profilePictureUrl,
           let url = URL(string: profileUrl) {
            AsyncImage(url: url) { image in
                image.resizable()
                     .scaledToFill()
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.3))
            }
            .frame(width: size, height: size)
            .clipShape(Circle())
        } else {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: size, height: size)
                .overlay(
                    Text(initials)
                        .font(.system(size: size / 2))
                        .foregroundColor(.white)
                        .bold()
                )
        }
    }
}


#Preview {
    UserAvatar(user: UserData(
        userId: UUID(),
        fullName: "Mohammed Ahmed",
        profilePictureUrl: "https://res.cloudinary.com/dhrj6nlxm/image/upload/v1756320817/profile/pictures/3b5904e5-186a-477e-882b-67979f20dbf3_pexels-imjimmyqian-2076596.jpg.jpg"
    ),
    size: 60)
}
