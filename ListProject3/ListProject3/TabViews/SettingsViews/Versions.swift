//
//  Versions.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct Versions: View {
    var body: some View {
        
        
        
        List {
        
            Section {
                VStack(alignment: .leading, spacing: 5)  {
                    Text("Key Features")
                        .fontWeight(.bold)
                        .padding(.bottom, 2)
                    Label("All new app design", systemImage: "minus")
                    Label("New Simplified Today Page", systemImage: "minus")
                        .padding(.leading, 40)
                    Label("Updated Time Machine Page", systemImage: "minus")
                        .padding(.leading, 40)
                    Label("Brand new Duration Page", systemImage: "minus")
                        .padding(.leading, 40)
                    Label("Fixed Settings page", systemImage: "minus")
                        .padding(.leading, 40)
                    Label("Copyable outputs in many different units", systemImage: "minus")
                    Label("Time Machine Page to pick any date", systemImage: "minus")
                    Label("Duration page to get distance between dates", systemImage: "minus")
                    Label("Badge app icon showing day/week/month/year", systemImage: "minus")
                    Label("Updated App Logo with ability to change between 8 colors", systemImage: "minus")
                    Label("New theme button to change the global theme of the app between 7 colors", systemImage: "minus")
                    Label("About page with more info on app and developer", systemImage: "minus")
                    
                    
                    Text("Resolved Issues")
                        .fontWeight(.bold)
                        .padding(.top)
                        .padding(.bottom, 2)
                    Label("Fixed formatting issues to fit on all phones", systemImage: "minus")
                    Label("Extra whitespace above tabs fix", systemImage: "minus")
                    Label("Fixed the week/day number badge to be accurate", systemImage: "minus")
                    Label("Title, font sizes, and color fixes", systemImage: "minus")
                    
                    Text("Overall")
                        .fontWeight(.bold)
                        .padding(.top)
                        .padding(.bottom, 2)
                    Label("Small bug fixed", systemImage: "minus")
                    Label("Stability fixes", systemImage: "minus")
                    Label("App Optimization", systemImage: "minus")
                }
                .font(.system(size: 14, weight: .regular))
            } header: {
                Text("Version 1.0.0")
            } footer: {
                VStack(alignment: .leading) {
                    Text("Version Release: July 18, 2024")
                }
                .font(.system(size: 10, weight: .regular))
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Versions")
                        .fontWeight(.semibold)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
        
        
        
        
        
    }
}

#Preview {
    Versions()
}
