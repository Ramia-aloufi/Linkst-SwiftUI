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
                    .offset(x:+20,y:-50)
            
            DSText(user.lastName + " " + user.firstName,font: .title)
                .offset(x:0,y:-50)
            DSText(user.profile.bio ?? "Bio",font: .title3,lineLimit: 2)
                .offset(x:0,y:-50)
            
            HStack{
                VStack{
                    DSText("Posts",font: .title3)
                    DSText("\(user.posts.count)",font: .callout)
                }
                Spacer()
                VStack{
                    DSText("Followers",font: .title3)
                    DSText("\(user.followers.count)",font: .callout)
                }
                Spacer()
                VStack{
                    DSText("Following",font: .title3)
                    DSText("\(user.following.count)",font: .callout)
                }
                
            }


        }.padding()

    }
}

#Preview {
//    ProfileHeader()
}
