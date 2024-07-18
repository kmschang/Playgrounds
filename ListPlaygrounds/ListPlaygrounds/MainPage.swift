//
//  MainPage.swift
//  ListPlaygrounds
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
        }
        .tabItem {
            Label("Today", systemImage: "doc.text.image")
        }
    }
}

#Preview {
    MainPage()
}
