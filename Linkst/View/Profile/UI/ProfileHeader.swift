//
//  ProfileHeader.swift
//  Linkst
//
//  Created by ramia n on 21/04/1447 AH.
//

import SwiftUI
import Kingfisher

struct ProfileHeader: View {
    let user:User
    var body: some View {
        VStack(alignment: .leading){
            KFImage(URL(string: user.profile.headerImageUrl ?? "https://picsum.photos/id/1018/200/300")!)
                    .resizable()
                    .frame(width: .infinity, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
            KFImage(URL(string:user.profile.profilePictureUrl ?? "https://picsum.photos/id/1018/200/300")!)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color.white, lineWidth: 3)
                    }
                    .offset(x:+20,y:-50)

            
            DSText(user.lastName + " " + user.firstName,font: .title)
                .offset(x:0,y:-50)
            DSText(user.profile.bio ?? "Bio",font: .body,color: Color.Text.secondary)
                .lineSpacing(8)
                .offset(x:0,y:-40)
            
            HStack{
                VStack{
                    DSText("Posts",font: .callout)
                    DSText("\(user.posts.count)",font: .callout)
                }                .offset(x:0,y:-20)

                Spacer()
                VStack{
                    DSText("Followers",font: .callout)
                    DSText("\(user.followers.count)",font: .callout)
                }                .offset(x:0,y:-20)

                Spacer()
                VStack{
                    DSText("Following",font: .callout)
                    DSText("\(user.following.count)",font: .callout)
                }                .offset(x:0,y:-20)

                
            }


        }.padding()

    }
}

#Preview {
    ProfileHeader(user: User(id: UUID(), firstName: "Lamar", lastName: "Aloufi", email: "aa@aa.com", followers: [UUID(),UUID()], following: [UUID(),UUID(),UUID()], savedPosts: [UUID(),UUID(),UUID()], profile: Profile(id: UUID(), bio: "", location: "", website: "", profilePictureUrl: "https://picsum.photos/id/1018/200/300", headerImageUrl: "https://picsum.photos/id/1018/200/300"), stories: [], posts: [], fullName: "Landry Aloufi")
    )
}
