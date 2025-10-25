//
//  ContentView.swift
//  Linkst
//
//  Created by ramia n on 18/03/1447 AH.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(Config.token) private var token: String?
    
    var body: some View {
        if(token == nil){
            AuthView().tint(Color("Primary"))
        }else{
            Tabs().tint(Color("Primary"))
        }
        
    }
}




#Preview {
    ContentView()
}
