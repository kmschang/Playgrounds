//
//  ContactUs.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct ContactItem: View {
    let iconName: String
    let linkURL: String
    let linkText: String
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var themeManager: ThemeManager

    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .padding(.trailing, 5)
                .foregroundStyle(themeManager.selectedTheme.color)
            Link(linkText, destination: URL(string: linkURL)!)
            .environment(\.openURL, OpenURLAction { _ in
                            print("---> testing link actioned")
                            return .systemAction
                        })
            .foregroundStyle(colorScheme == .dark ? .white : .black)
            
            Spacer()
            Image(systemName: "arrow.up.right")
                .foregroundStyle(themeManager.selectedTheme.color)
        }
    }
}

struct ContactUs: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        
        List {
            
            Section {
                // TODO: Update Contact Information
                ContactItem(iconName: "envelope.fill",
                            linkURL: "mailto:support@sonnazgroup.com",
                            linkText: "support@sonnazgroup.com")
                ContactItem(iconName: "phone.fill",
                            linkURL: "tel:0",
                            linkText: "+* (***) ***-****")
                ContactItem(iconName: "map.fill",
                            linkURL: "https://maps.apple.com/?address=Apple%20Park,%20One%20Apple%20Park%20Way,%20Cupertino,%20CA%2095014,%20United%20States&ll=37.3349,-122.0090&q=Apple%20Park&t=m",
                            linkText: "1 Apple Park Way\nCupertin, CA 95014 \nUnited States")
            } header: {
                Text("Direct Contact Information")
            }
            
            Section {
                // TODO: Update the links for leaving comments and rating
                ContactItem(iconName: "star.fill",
                            linkURL: "https://apple.com",
                            linkText: "Leave a rating")
                ContactItem(iconName: "text.badge.checkmark",
                            linkURL: "https://apple.com",
                            linkText: "Leave a review")
            } header: {
                Text("App Store Feedback")
            }
            
            Section {
                NavigationLink (destination: Versions()) {
                    Label("Versions", systemImage: "square.stack.3d.up.fill")
                }
            } header: {
                Text("Versions")
            }
            
            
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("Contact Us")
                    .fontWeight(.semibold)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
struct ContactUs_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample ThemeManager for the preview
        let themeManager = ThemeManager()
        themeManager.selectedTheme = .default(.blue) // Set a default theme for the preview
        
        return ContactUs()
            .environmentObject(themeManager) // Inject the sample ThemeManager
    }
}
