//
//  HomeView.swift
//  ListPlaygrounds
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                
                Section {
                    Text("1")
                    Text("1")
                    Text("1")
                    Text("1")
                    Text("1")
                    Text("1")
                    Text("1")
                    Text("1")
                } header: {
                    Text("Header 1")
                } footer: {
                    Text("Footer 1")
                }
                
                
            }
        }
        .navigationBarHidden(false)
        .navigationTitle("App Theme")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView()
}
