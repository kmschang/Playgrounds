//
//  AppearanceSelectionView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/19/24.
//

import SwiftUI

struct AppearanceSelectionView: View {
    @EnvironmentObject var appearanceManager: AppearanceManager

    var body: some View {
        List {
            Section(header: Text("Auto")) {
                themeRow(for: .auto)
            }
            
            Section(header: Text("Default")) {
                ForEach(Appearance.allCases.filter { $0 != .auto }) { theme in
                    themeRow(for: theme)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Select Theme")
    }
    
    private func themeRow(for theme: Appearance) -> some View {
        HStack {
            Text(theme.rawValue)
            Spacer()
            if appearanceManager.selectedTheme == theme {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            appearanceManager.selectedTheme = theme
        }
    }
}


#Preview {
    AppearanceSelectionView()
}
