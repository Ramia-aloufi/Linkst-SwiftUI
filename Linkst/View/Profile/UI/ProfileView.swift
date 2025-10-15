//
//  ProfileView.swift
//  Linkst
//
//  Created by ramia n on 17/04/1447 AH.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm:UserViewModel = .init()
    var body: some View {
        switch vm.state {
        case .loading:
            ProgressView()
        case .data(let t):
            ScrollView{
                ProfileHeader(user:t)
                ProfileTabs(userId:t.id)

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
