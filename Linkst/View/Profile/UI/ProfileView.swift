//
//  ProfileView.swift
//  Linkst
//
//  Created by ramia n on 17/04/1447 AH.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var vm = UserViewModel.shared
    var body: some View {
        switch vm.state {
        case .loading:
            ProgressView()
        case .data(let t):
            ScrollView{
                ProfileHeader(user:t)
                ProfileTabs(userId:t.id)
                        .offset(x:0,y:-20)

            }
        case .error(let string):
            Text("\(string)")
        case .empty,.idle:
            Text("Empty")
        }
    }
}

#Preview {
    ProfileView()
}
