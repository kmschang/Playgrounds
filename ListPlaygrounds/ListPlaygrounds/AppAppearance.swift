import SwiftUI

struct AppAppearance: View {
    @Binding var customColors: [CustomColors]
    @Binding var defaultColors: [DefaultColors]
    
    @State private var addCustomColorPopover: Bool = false
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
        
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(defaultColors.indices, id: \.self) { index in
                        Button {
                            selectDefaultColor(at: index)
                        } label: {
                            HStack {
                                Label(defaultColors[index].colorName, systemImage: defaultColors[index].isSelected ? "circle.fill" : "circle")
                                    .foregroundColor(defaultColors[index].color)
                                Spacer()
                                if defaultColors[index].isSelected {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(defaultColors[index].color)
                                }
                            }
                        }
                    }
                } header: {
                    Text("Default App Colors")
                } footer: {
                    Text("Colors that come with the app")
                }
                
                Section {
                    ForEach(customColors.indices, id: \.self) { index in
                        Button {
                            selectCustomColor(at: index)
                        } label: {
                            HStack {
                                Label(customColors[index].colorName, systemImage: customColors[index].isSelected ? "circle.fill" : "circle")
                                    .foregroundColor(Color(hex: customColors[index].colorHEX))
                                Spacer()
                                if customColors[index].isSelected {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(Color(hex: customColors[index].colorHEX))
                                }
                            }
                        }
                    }
                    Button {
                        addCustomColorPopover.toggle()
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                } header: {
                    Text("Custom App Colors")
                } footer: {
                    Text("Custom app colors that the user added later")
                }
            }
            .popover(isPresented: $addCustomColorPopover) {
                AddCustomColor(customColors: $customColors, customName: "", customHEX: "")
            }
            .onChange(of: colorScheme, initial: false) { oldValue, newValue in
                setupDefaultColors()
            }
        }
        .navigationBarHidden(false)
        .navigationTitle("App Theme")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    private func selectDefaultColor(at index: Int) {
        for i in defaultColors.indices {
            defaultColors[i].isSelected = i == index
        }
        for i in customColors.indices {
            customColors[i].isSelected = false
        }
    }
    
    private func selectCustomColor(at index: Int) {
        for i in customColors.indices {
            customColors[i].isSelected = i == index
        }
        for i in defaultColors.indices {
            defaultColors[i].isSelected = false
        }
    }
    
    private func setupDefaultColors() {
        defaultColors = [
            DefaultColors(colorName: "Red", color: .red, colorUI: .red, isSelected: false),
            DefaultColors(colorName: "Orange", color: .orange, colorUI: .orange, isSelected: false),
            DefaultColors(colorName: "Yellow", color: .yellow, colorUI: .yellow, isSelected: false),
            DefaultColors(colorName: "Green", color: .green, colorUI: .green, isSelected: false),
            DefaultColors(colorName: "Blue", color: .blue, colorUI: .blue, isSelected: false),
            DefaultColors(colorName: "Purple", color: .purple, colorUI: .purple, isSelected: false),
            DefaultColors(colorName: "Auto", color: colorScheme == .dark ? .white : .black, colorUI: colorScheme == .dark ? .white : .black, isSelected: true)
        ]
    }
}

#Preview {
    ContentView()
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
