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
                    Label("App Premium", systemImage: "lock.fill")
                }
            } header: {
                Text("Premium Version")
            }
            
            Section {
                NavigationLink(destination: Text("Account")) {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
                NavigationLink(destination: Text("Sync")) {
                    Label("Sync", systemImage: "arrow.triangle.2.circlepath.circle.fill")
                }
            } header: {
                Text("Account Setup")
            }
            
            Section {
                NavigationLink(destination: Text("App Appearance")) {
                    Label("App Appearance", systemImage: "paintbrush.fill")
                }
                NavigationLink(destination: Text("App Theme")) {
                    Label("App Theme", systemImage: "paintpalette.fill")
                }
                NavigationLink(destination: Text("App Icons")) {
                    Label("App Icons", systemImage: "app.badge.checkmark.fill")
                }
            } header: {
                Text("App Customizatoin")
            }
            
            Section {
                NavigationLink(destination: Text("Notifications")) {
                    Label("Notifications", systemImage: "bell.badge.fill")
                }
                NavigationLink(destination: Text("App Badges")) {
                    Label("App Badges", systemImage: "app.badge.fill")
                }
                NavigationLink(destination: Text("Face ID")) {
                    Label("Face ID", systemImage: "faceid")
                }
            } header: {
                Text("App Behavior")
            }
            
            Section {
                NavigationLink(destination: Text("About App")) {
                    Label("About App", systemImage: "list.bullet.clipboard.fill")
                }
                NavigationLink(destination: Text("About Developer")) {
                    Label("About Developer", systemImage: "person.fill")
                }
                NavigationLink(destination: Text("Contact Us")) {
                    Label("Contact Us | Feedback", systemImage: "square.and.pencil")
                }
                NavigationLink(destination: PrivacyPolicy()) {
                    Label("Privacy Policy", systemImage: "exclamationmark.shield.fill")
                }
                NavigationLink(destination: TermsOfUse()) {
                    Label("Terms of Use", systemImage: "hand.tap.fill")
                }
            } header: {
                Text("About")
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Button {
                    infoScreen.toggle()
                } label: {
                    Label("Info", systemImage: "info.circle.fill")
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
                    Label("Contact", systemImage: "envelope.circle.fill")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .popover(isPresented: $infoScreen, content: {
            NavigationView {
                InfoPopUp()
            }
        })
        .popover(isPresented: $contactScreen, content: {
            NavigationView {
                ContactPopUp()
            }
        })

        
        
    }
}

#Preview {
    ContentView()
}
