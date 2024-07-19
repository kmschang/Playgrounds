//
//  ContentView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Variables
    // Default page for now
    @State private var selection = 4;
    

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var themeManager: ThemeManager
        
    // MARK: - Main Body
    var body: some View {
        
        
        
        ZStack {
            TabView(selection: $selection,
                    content:  {
                NavigationView {
                    Text("1st Tab")
                } .tabItem { Label("1st Tab", systemImage: "1.circle") }
                    .tag(1)
                NavigationView {
                    Text("2nd Tab")
                } .tabItem { Label("2nd Tab", systemImage: "2.circle") }
                    .tag(2)
                NavigationView {
                    Text("3rd Tab")
                } .tabItem { Label("3rd Tab", systemImage: "3.circle") }
                    .tag(3)
                NavigationView {
                    SettingsView(themeManager2: ThemeManager())
                } .tabItem { Label("Settings", systemImage: "gear") }
                    .tag(4)
            })
            .tint(themeManager.selectedTheme.color)
        }
            
    }
    
    
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample ThemeManager for the preview
        let themeManager = ThemeManager()
        themeManager.selectedTheme = .default(.blue) // Set a default theme for the preview
        
        return ContentView()
            .environmentObject(themeManager) // Inject the sample ThemeManager
    }
}

// MARK: - HEX Color Extension
extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
