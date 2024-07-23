//
//  ListProject3App.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

@main
struct ListProject3App: App {
    
    @StateObject private var themeManager = ThemeManager()
    @StateObject private var appearanceViewModel = AppearanceViewModel()
    
    let pasteboard = UIPasteboard.general

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .environmentObject(appearanceViewModel)
        }
    }
}
