//
//  InfoPopUp.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct assetLink: View {
    let linkURL: String
    let linkText: String
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        HStack {
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

struct InfoPopUp: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
    
        NavigationStack {
            
            
                
            List {
                
                VStack {
                    
                    HStack {
                        Spacer()
                        Text("App Name")
                            .font(.system(size: 24, weight: .bold))
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Version \(Bundle.main.releaseVersionNumber ?? "1.0.0") (\(Bundle.main.buildVersionNumber ?? "1"))")
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("By Sonnaz Group")
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("© 2023 - 2024")
                        Spacer()
                    }
                    
                    
                }
                
                Section {
                    NavigationLink(destination: Versions()) {
                        Text("Versions")
                    }
                }
                
                Section {
                    NavigationLink(destination: PrivacyPolicy()) {
                        Text("Privacy Policy")
                    }
                    NavigationLink(destination: TermsOfUse()) {
                        Text("Terms of Use")
                    }
                    NavigationLink(destination: ContactUs()) {
                        Text("Contact Us")
                    }
                }
                
                Section {
                    NavigationLink(destination: AboutApp()) {
                        Text("About App")
                    }
                    NavigationLink(destination: AboutDeveloper()) {
                        Text("About Developer")
                    }
                }
                
                Section {
                    assetLink(linkURL: "https://apple.com",
                              linkText: "Asset #1")
                    assetLink(linkURL: "https://apple.com",
                              linkText: "Asset #2")
                    assetLink(linkURL: "https://apple.com",
                              linkText: "Asset #3")
                } header: {
                    Text("Included Assets")
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Back", systemImage: "chevron.down")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("About")
                        .fontWeight(.semibold)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        
            
            
        
    }
}

// MARK: - Preview
struct InfoPopUp_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample ThemeManager for the preview
        let themeManager = ThemeManager()
        themeManager.selectedTheme = .default(.blue) // Set a default theme for the preview
        
        return InfoPopUp()
            .environmentObject(themeManager) // Inject the sample ThemeManager
    }
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
