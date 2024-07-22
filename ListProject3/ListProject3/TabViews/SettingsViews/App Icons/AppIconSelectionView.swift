//
//  AppIconSelectionView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import SwiftUI

struct AppIconView: View {
    @StateObject private var iconManager = AppIconManager()
    @EnvironmentObject var themeManager: ThemeManager // Add this line
    
    var body: some View {
        List {
            Section(header: Text("Default")) {
                AppIconList(icon: .primary, iconManager: iconManager, themeColor: themeManager.selectedTheme.color)
            }
            
            Section(header: Text("Color Options")) {
                ForEach(AppIcon.allCases.filter { $0 != .primary }) { icon in
                    AppIconList(icon: icon, iconManager: iconManager, themeColor: themeManager.selectedTheme.color)
                }
            }
        }
        .navigationTitle("App Icons")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AppIconList: View {
    let icon: AppIcon
    @ObservedObject var iconManager: AppIconManager
    let themeColor: Color // Add this line
    
    var body: some View {
        HStack {
            Image(icon.previewFileName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            
            Text(icon.name)
            
            Spacer()
            
            if iconManager.currentIcon == icon {
                Image(systemName: "checkmark")
                    .foregroundColor(themeColor) // Use the theme color here
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            iconManager.changeAppIcon(to: icon)
        }
    }
}

// MARK: - PREVIEW
struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppIconView()
                .environmentObject(ThemeManager()) // Add this line for the preview
        }
    }
}
