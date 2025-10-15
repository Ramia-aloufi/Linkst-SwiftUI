//
//  SearchView.swift
//  Linkst
//
//  Created by ramia n on 23/04/1447 AH.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    DSTextField("username", text: $searchText)
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle(Text("Search"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
