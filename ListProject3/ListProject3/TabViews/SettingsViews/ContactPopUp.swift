//
//  ContactPopUp.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct ContactPopUp: View {
    
    @Environment(\.dismiss) var dismiss
    
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
                    Label("Versions", systemImage: "square.stack.3d.up.fill")
                }
            } header: {
                Text("Versions")
            }
            
            
        } .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Label("Back", systemImage: "chevron.down")
                }
            }
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
    ContactPopUp()
}
