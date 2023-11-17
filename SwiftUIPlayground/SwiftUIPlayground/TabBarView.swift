//
//  TabBarView.swift
//  SwiftUIPlayground
//
//  Created by Kyle Schang on 11/17/23.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selection: String = "home"
    
    var body: some View {
        TabView(selection: $selection) {
            TabViewOne().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            TabViewTwo().tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

#Preview {
    TabBarView()
}
