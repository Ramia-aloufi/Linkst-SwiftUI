//
//  ProfileTabs.swift
//  Linkst
//
//  Created by ramia n on 21/04/1447 AH.
//

import SwiftUI

struct ProfileTabs: View {
    let userId:UUID
    @State var isSelected: Int? = 0
    var body: some View {
        VStack{
            HStack{
                DSButton("Posts",style: .ghost, action: {
                    isSelected = 0
                }).tag(0)
                    .overlay(alignment:.bottom) {
                        Rectangle()
                            .frame(height: 1)
                            .opacity(isSelected == 0 ? 1 : 0)
                    }
                
                
                Spacer()
                
                DSButton("Reels",style: .ghost, action: {
                    isSelected = 1
                    
                })
                .tag(1)
                .overlay(alignment:.bottom) {
                    Rectangle()
                        .frame(height: 1)
                        .opacity(isSelected == 1 ? 1 : 0)
                }
                Spacer()
                DSButton("Projects",style: .ghost, action: {
                    isSelected = 2
                    
                })
                .tag(2)
                .overlay(alignment:.bottom) {
                    Rectangle()
                        .frame(height: 1)
                        .opacity(isSelected == 2 ? 1 : 0)
                }
                

            }
            switch isSelected ?? 0 {
            case 0:
                UserPostsView()
            case 1:
                UserReelsView(userId: userId)
            default:
                Text("Projects")
            }
        }
    }
}

#Preview {
    ProfileTabs(userId:UUID(uuidString: "28306bf9-4e77-479d-95e3-daafe40a6f86") ?? UUID())
}
