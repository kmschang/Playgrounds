//
//  AboutApp.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

// MARK: - ShareItem Template
struct ShareItem: View {
    let iconName: String
    let linkURL: String
    let linkText: String
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var themeManager: ThemeManager

    
    var body: some View {
        HStack {
            Image(iconName)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.trailing, 5)
                .foregroundStyle(themeManager.selectedTheme.color)
            Link(destination: URL(string: linkURL)!) {
                Text(linkText)
                    .tint(colorScheme == .dark ? .white : .black)
            }
            Spacer()
            Image(systemName: "arrow.up.right")
                .foregroundStyle(themeManager.selectedTheme.color)
        }
    }
}

// MARK: - Main View
struct AboutApp: View {
    
    @StateObject private var iconViewModel = AppIconViewModel()
    @EnvironmentObject var appearanceViewModel: AppearanceViewModel
        
    var body: some View {
        
        AppearanceSettingsView(viewModel: appearanceViewModel)
        
        List {
            
            Section {
                
                Image(iconViewModel.getCurrentIconPreviewName())
                    .resizable()
                    .listRowBackground(Color.red.opacity(0))
                    .frame(width: UIScreen.main.bounds.size.width / 1.25, height: UIScreen.main.bounds.size.width / 1.25, alignment: .center)
                    .listRowSeparator(.hidden)
                
                HStack {
                    Spacer()
                    Text("Day Calculator")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .listRowBackground(Color.red.opacity(0))
                .listRowSeparator(.hidden)
                
                HStack {
                    Spacer()
                    Text("Version \(Bundle.main.releaseVersionNumber ?? "1.0.0") (\(Bundle.main.buildVersionNumber ?? "1"))")
                    Spacer()
                }
                .listRowBackground(Color.red.opacity(0))
                .listRowSeparator(.hidden)
                
            }
            
            Section {
                // Add Content to share with others
                ContactItem(iconName: "message.fill",
                            linkURL: "https://apple.com",
                            linkText: "Share via messages")
                ContactItem(iconName: "envelope.fill",
                            linkURL: "https://apple.com",
                            linkText: "Share via mail")
                ShareItem(iconName: "Facebook.SFSymbol",
                            linkURL: "https://apple.com",
                            linkText: "Share via Facebook")
                ShareItem(iconName: "Instagram.SFSymbol",
                            linkURL: "https://apple.com",
                            linkText: "Share via Instagram")
                ShareItem(iconName: "X.SFSymbol",
                            linkURL: "https://apple.com",
                            linkText: "Share via X")
                ShareItem(iconName: "mastodon.SFSymbol",
                            linkURL: "https://apple.com",
                            linkText: "Share via Mastodon")
                ShareItem(iconName: "Snapchat.SFSymbol",
                            linkURL: "https://apple.com",
                            linkText: "Share via SnapChat")
            } header : {
                Text("Share")
            } footer: {
                Text("Thank you for your support")
            }
            
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("About App")
                    .fontWeight(.semibold)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
struct AboutApp_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample ThemeManager for the preview
        let themeManager = ThemeManager()
        themeManager.selectedTheme = .default(.blue) // Set a default theme for the preview
        
        // Create a sample AppearanceViewModel for the preview
        let appearanceViewModel = AppearanceViewModel()
        appearanceViewModel.selectedMode = .automatic // Set a default appearance mode for the preview
        
        return AboutApp()
            .environmentObject(themeManager) // Inject the sample ThemeManager
            .environmentObject(appearanceViewModel) // Inject the sample AppearanceViewModel
    }
}
