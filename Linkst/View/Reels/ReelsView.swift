//
//  ReelsView.swift
//  Linkst
//
//  Created by ramia n on 14/04/1447 AH.
//

import SwiftUI
import AVFoundation

struct ReelsView: View {
    
    @StateObject var vm: ReelsViewModel = .init()
    @State private var currentIndex: Int = 0
    
    var visibleReels: [Reels]{
        if case let .data(items) = vm.state {
            let start = max(currentIndex - 1, 0)
            let end = min(currentIndex + 1, items.count - 1)
            return Array(items[start...end])
        }
        return []
    }

    var body: some View {
        switch vm.state {
        case .loading:
            ProgressView()
        case .error(let error):
            Text("Error: \(error)")
        case .data(let data):
            ReelsPagerView(reels: data)
        case .empty:
            Text("No data")
        }
    }


  }


#Preview {
    ReelsView()
}
