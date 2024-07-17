//
//  AppAppearance.swift
//  ListPlaygrounds
//
//  Created by Kyle Schang on 7/17/24.
//

import SwiftUI

struct AppAppearance: View {
    
    @State private var customColors = CustomColors.preview()
    @State private var defaultColors = DefaultColors.preview()
    
    var body: some View {
        NavigationView {
            
            List {
                
                Section {
                    ForEach (defaultColors) {color in
                        Button {
                            
                        } label: {
                            Label(color.colorName, systemImage: color.isSelected ? "circle.fill" : "circle")
                                .foregroundStyle(color.color)
                        }
                    }
                } header: {
                    Text("Default App Colors")
                } footer: {
                    Text("Colors that come with the app")
                }
                
                
                Section {
                    ForEach(customColors) {color in
                        Button {
                            
                        } label: {
                            Label(color.colorName, systemImage: color.isSelected ? "circle.fill" : "circle")
                                .foregroundStyle(Color(hex: color.colorHEX))
                        }

                    }
                    Button {
                        let newCustomColor = CustomColors(colorName: "NEW COLOR \(customColors.count + 1)", colorHEX: "#000000", isSelected: false)
                        withAnimation {
                            customColors.append(newCustomColor)
                        }
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                } header: {
                    Text("Custom App Colors")
                } footer: {
                    Text("Custom app colors that the user added later")
                }
                
                
            } .toolbar {
                Button {
                    
                    
                } label: {
                    Label("Add Custom Color", systemImage: "plus")
                }
            }
            
        }
        .navigationTitle("App Appearance")
    }
}


#Preview {
    AppAppearance()
}

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
