//
//  InfoPopUp.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

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
                    NavigationLink(destination: Text("About Developer")) {
                        Text("About Developer")
                    }
                }
                
                Section {
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        Text("Asset #1")
                            .tint(colorScheme == .dark ? .white : .black)
                    }
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        Text("Asset #2")
                            .tint(colorScheme == .dark ? .white : .black)
                    }
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

#Preview {
    InfoPopUp()
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
