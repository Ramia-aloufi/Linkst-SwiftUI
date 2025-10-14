//
//  ContentView.swift
//  Linkst
//
//  Created by ramia n on 18/03/1447 AH.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        if(TokenManager.shared.token == nil){
            AuthView()
        }else{
            Tabs()
        }

    }
}




#Preview {
    ContentView()
}
