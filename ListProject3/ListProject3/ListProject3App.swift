//
//  ListProject3App.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

@main
struct ListProject3App: App {
    
    @AppStorage("themeColor") var themeColor:Int = 2
    
    var body: some Scene {
        WindowGroup {
            ContentView(themeColor: $themeColor)
        }
    }
}
