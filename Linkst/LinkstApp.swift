//
//  LinkstApp.swift
//  Linkst
//
//  Created by ramia n on 18/03/1447 AH.
//

import SwiftUI

@main
struct LinkstApp: App {
    
    @ObservedObject var userVM = UserViewModel.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(Color("Primary"))
                .environmentObject(userVM)
           
        }
    }
}
