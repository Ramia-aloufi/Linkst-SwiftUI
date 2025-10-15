//
//  Tabs.swift
//  Linkst
//
//  Created by ramia n on 29/03/1447 AH.
//

import SwiftUI

struct Tabs: View {
    @State private var selectedTabIndex: Int = 0
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                Feed()
            }
            .badge(2)
            Tab("Reels", systemImage: "film") {
                ReelsView()
            }
            Tab("Search", systemImage: "magnifyingglass") {
                SearchView()
            }
            Tab("Messages", systemImage: "envelope") {
                ChatView()
            }
            Tab("Account", systemImage: "person.crop.circle.fill") {
                ProfileView()
            }
            .badge("!")
        }
    }
}

#Preview {
    Tabs()
}
