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
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .padding(.trailing, 5)
            Link(destination: URL(string: linkURL)!) {
                Text(linkText)
                    .tint(colorScheme == .dark ? .white : .black)
            }
            Spacer()
            Image(systemName: "arrow.up.right")
                .opacity(0.3)
        }
    }
}

struct ContactUs: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        
        List {
            
            Section {
                // Update Contact Information Before Publishing
                // TODO Update Contact Information
                ContactItem(iconName: "envelope.fill",
                            linkURL: "mailto:support@sonnazgroup.com",
                            linkText: "support@sonnazgroup.com")
                ContactItem(iconName: "phone.fill",
                            linkURL: "tel:2489608275",
                            linkText: "+1 (248) 960-8275")
                ContactItem(iconName: "map.fill",
                            linkURL: "https://maps.apple.com/place?auid=14992674820182691193&lsp=9902",
                            linkText: "2125 Campus Road\nToledo, OH 43623 \nUnited States")
            } header: {
                Text("Direct Contact Information")
            }
            
            Section {
                // Update the links for leaving comments and rating
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
                    HStack {
                        Image(systemName: "square.stack.3d.up")
                            .padding(.trailing, 5)
                        Text("Versions")
                    }
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

#Preview {
    ContactUs()
}
