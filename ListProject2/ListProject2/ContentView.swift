//
//  ContentView.swift
//  ListProject2
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var themeColor: Int = 1
    
    var body: some View {
        
        NavigationView {
            HomePage(themeColor: $themeColor)
        } .tint(themeColor == 1 ? .red : .blue)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        
        
        
    }
}










#Preview {
    ContentView()
}
