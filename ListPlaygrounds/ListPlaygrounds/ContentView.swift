//
//  ContentView.swift
//  ListPlaygrounds
//
//  Created by Kyle Schang on 7/17/24.
//

import SwiftUI

enum AppearanceStyle {
    case dark
    case light
    case auto
}

enum ThemeColor {
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case black
    case white
    case auto
}


enum IconColor {
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case black
    case white
    case rainbow
}


struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State var username:String = ""
    @State var privateAccount:Bool = true
    
    @State var themeColor:ThemeColor = .auto
    @State var appearance:AppearanceStyle = .auto
    @State var iconColor:IconColor = .white
    
    
    
    
    var body: some View {
        
        NavigationView {
            List {
                
                Section {
                    TextField("Username", text:$username)
                    Toggle("Private Account", isOn: $privateAccount)
                } header: {
                    Text("Profile")
                } footer: {
                    Text("Everything you need to change when it comes to your account settings")
                }
                
                
                Section {
                    NavigationLink(destination: AppAppearance()) {
                        Text("App Appearance")
                    }
                    NavigationLink(destination: AppAppearance()) {
                        Text("App Theme")
                    }
                    NavigationLink(destination: AppAppearance()) {
                        Text("App Icon")
                    }
                } header: {
                    Text("App Customization")
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
