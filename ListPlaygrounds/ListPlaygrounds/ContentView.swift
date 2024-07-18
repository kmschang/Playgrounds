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
    @State var defaultColors: [DefaultColors] = [
        DefaultColors(colorName: "Red", color: .red, colorUI: .red, isSelected: false),
        DefaultColors(colorName: "Orange", color: .orange, colorUI: .orange, isSelected: false),
        DefaultColors(colorName: "Yellow", color: .yellow, colorUI: .yellow, isSelected: false),
        DefaultColors(colorName: "Green", color: .green, colorUI: .green, isSelected: false),
        DefaultColors(colorName: "Blue", color: .blue, colorUI: .blue, isSelected: false),
        DefaultColors(colorName: "Purple", color: .purple, colorUI: .purple, isSelected: false),
        DefaultColors(colorName: "Black", color: .black, colorUI: .black, isSelected: false),
        DefaultColors(colorName: "White", color: .white, colorUI: .white, isSelected: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Username", text: $username)
                    Toggle("Private Account", isOn: $privateAccount)
                } header: {
                    Text("Profile")
                } footer: {
                    Text("Everything you need to change when it comes to your account settings")
                }
                
                Section {
                    NavigationLink(destination: AppAppearance(customColors: $customColors, defaultColors: $defaultColors)) {
                        Text("App Appearance")
                    }
                    NavigationLink(destination: AppAppearance(customColors: $customColors, defaultColors: $defaultColors)) {
                        Text("App Theme")
                    }
                    NavigationLink(destination: AppAppearance(customColors: $customColors, defaultColors: $defaultColors)) {
                        Text("App Icon")
                    }
                } header: {
                    Text("App Customization")
                } footer: {
                    Text("Everything you need to change and more regarding the appearance of the app")
                }
            }
            .navigationTitle("App Settings")
        }
    }
}

#Preview {
    ContentView()
}
