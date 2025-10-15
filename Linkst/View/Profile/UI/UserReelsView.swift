//
//  UserReelsView.swift
//  Linkst
//
//  Created by ramia n on 22/04/1447 AH.
//

import SwiftUI

struct UserReelsView: View {
    let userId:UUID
    
    @ObservedObject var viewModel:ReelsViewModel = ReelsViewModel.shared
    var body: some View {
        VStack{
            
            
            switch viewModel.userReels {
            case .idle:
                Text("idle")
            case .loading:
                ProgressView()
            case .data(let reels):
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                    
                ]
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(reels, id: \.self) { reel in
                            UserReelsCard(reels: reel)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                }
            case .error(let string):
                DSText(string, color: .red)
            case .empty:
                DSText("empty")
            }
        }
        .onAppear{
                Task{
                    await viewModel.getUserReels(userId: userId)
                }
            }
    }
}

#Preview {
    UserReelsView(userId: UUID(uuidString: "28306bf9-4e77-479d-95e3-daafe40a6f86") ?? UUID())
}
