//
//  AboutDeveloper.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct AboutDeveloper: View {
    var body: some View {
        List {
            
            Section {
                
                Image("SonnazGroupLogo_RedTransparent")
                    .resizable()
                    .listRowBackground(Color.red.opacity(0))
                    .frame(width: UIScreen.main.bounds.size.width / 1.25, height: UIScreen.main.bounds.size.width / 1.25, alignment: .center)
                    .listRowSeparator(.hidden)
                
                HStack {
                    Spacer()
                    Text("Sonnaz Group, LLC")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .listRowBackground(Color.red.opacity(0))
                .listRowSeparator(.hidden)
                
                HStack {
                    Spacer()
                    Text("Sonnaz Group © 2023-2024. All Rights Reserved")
                        .font(.system(size:10))
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
                Text("About Developer")
                    .fontWeight(.semibold)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AboutDeveloper()
}
