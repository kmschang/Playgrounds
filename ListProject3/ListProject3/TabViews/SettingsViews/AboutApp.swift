//
//  AboutApp.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct ShareItem: View {
    let iconName: String
    let linkURL: String
    let linkText: String
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        HStack {
            Image(iconName)
                .resizable()
                .frame(width: 20, height: 20)
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

struct AboutApp: View {
    var body: some View {
        List {
            
            Section {
                
                Image("DayCalculatorLogoRounded2_Red")
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

#Preview {
    AboutApp()
}