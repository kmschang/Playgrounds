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
    @StateObject private var viewModel = DateViewModel()
    
    @Environment(\.scenePhase) private var scenePhase
    
    let pasteboard = UIPasteboard.general

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .environmentObject(appearanceViewModel)
                .environmentObject(viewModel)
        }
        .onChange(of: scenePhase) { oldPhase, newPhase in
            if newPhase == .active {
                viewModel.appBecameActive()
            }
        }
    }
}
