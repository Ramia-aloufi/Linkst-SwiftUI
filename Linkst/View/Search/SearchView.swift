//
//  SearchView.swift
//  Linkst
//
//  Created by ramia n on 23/04/1447 AH.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @ObservedObject var viewModel = UserViewModel.shared
    @State var searchText: String = ""
    @State private var searchTask: Task<Void, Never>? = nil

    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    DSTextField("username", text: $searchText)
                        .onChange(of: searchText) { _, newValue in
                            searchTask?.cancel()
                            searchTask =  Task {
                                try? await Task.sleep(for: .seconds(3))
                                guard !Task.isCancelled else { return }
                                guard !searchText.isEmpty else {
//                                    users = []
                                    return
                                }
                                await viewModel.searchUser(text: searchText)
                                
                            }
                        }
                    switch viewModel.userSearch {
                    case .idle:
                        Text("")
                    case .loading:
                        ProgressView()
                    case .data(let t):
                        SearchCard(users: t)
                    case .error(let string):
                        Text("\(string)")
                    case .empty:
                        Text("No data")
                    }
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
