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
}

func updateTheme(themeColor: ThemeColor) -> Color {
    switch themeColor {
    case .red:
        return .red
    case .orange:
        return .orange
    case .yellow:
        return .yellow
    case .green:
        return .green
    case .blue:
        return .blue
    case .purple:
        return .purple
    case .auto:
        return .primary
    }
}

struct DefaultColors: Identifiable {
    var colorName: String
    var color: Color
    var colorUI: UIColor
    var isSelected: Bool
    let id = UUID()
}

struct CustomColors: Identifiable {
    var colorName: String
    var colorHEX: String
    var isSelected: Bool
    let id = UUID()
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State var username: String = ""
    @State var privateAccount: Bool = true
    
    @State var themeColor: ThemeColor = .auto
    @State var appearance: AppearanceStyle = .auto
    @State var iconColor: IconColor = .white
    
    @State var customColors: [CustomColors] = []
    @State var defaultColors: [DefaultColors] = []
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: AppAppearance(customColors: $customColors, defaultColors: $defaultColors, themeColor: $themeColor, appearance: $appearance, iconColor: $iconColor)) {
                        Text("App Appearance")
                    }
                    NavigationLink(destination: AppAppearance(customColors: $customColors, defaultColors: $defaultColors, themeColor: $themeColor, appearance: $appearance, iconColor: $iconColor)) {                        Text("App Theme")
                    }
                    NavigationLink(destination: AppAppearance(customColors: $customColors, defaultColors: $defaultColors, themeColor: $themeColor, appearance: $appearance, iconColor: $iconColor)) {                        Text("App Icon")
                    }
                } header: {
                    Text("App Customization")
                } footer: {
                    Text("Everything you need to change and more regarding the appearance of the app")
                }
            }
            .navigationTitle("App Settings")
        }
        .onAppear {
            setupDefaultColors()
        }.onChange(of: colorScheme, initial: false) { oldValue, newValue in
            setupDefaultColors()
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
