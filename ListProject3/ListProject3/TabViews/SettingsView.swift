//
//  SettingsView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var infoScreen:Bool = false
    @State private var contactScreen:Bool = false
    
    var body: some View {
        List {
            
            Section {
                NavigationLink(destination: Text("App Premium")) {
                    Text("App Premium")
                }
            } header: {
                Text("Premium Version")
            }
            
            Section {
                NavigationLink(destination: Text("Account")) {
                    Text("Account")
                }
                NavigationLink(destination: Text("Sync")) {
                    Text("Sync")
                }
            } header: {
                Text("Account Setup")
            }
            
            Section {
                NavigationLink(destination: Text("Notifications")) {
                    Text("Notifications")
                }
                NavigationLink(destination: Text("App Badges")) {
                    Text("App Badges")
                }
            } header: {
                Text("App Behavior")
            }
            
            
            
        }
        .popover(isPresented: $infoScreen, content: {
            NavigationLink(destination: Text("Info Screen")) {
                NavigationView {
                    Text("Info Screen")
                }
            }
        })
        .popover(isPresented: $contactScreen, content: {
        NavigationLink(destination: Text("Contact Screen")) {
            NavigationView {
                Text("Contact Screen")
                }
            }
        })
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Button {
                    infoScreen.toggle()
                } label: {
                    Label("Info", systemImage: "info.circle")
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Cool Title")
                    .fontWeight(.semibold)
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    contactScreen.toggle()
                } label : {
                    Label("Contact", systemImage: "envelope.fill")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)

        
        
    }
}

#Preview {
    ContentView()
}
