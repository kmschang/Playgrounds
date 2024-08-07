//
//  ThemeSelectionView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/19/24.
//

import SwiftUI

struct ThemeSelectionView: View {
    @ObservedObject var themeManager: ThemeManager
    @State private var showingAddCustomColor = false
    
    var body: some View {
        List {
            Section(header: Text("Automatic")) {
                ThemeRow(theme: .auto, isSelected: themeManager.selectedTheme == .auto) {
                    themeManager.selectTheme(.auto)
                }
            }
            
            Section(header: Text("Default Colors")) {
                ForEach(DefaultColor.allCases, id: \.self) { defaultColor in
                    ThemeRow(theme: .default(defaultColor), isSelected: themeManager.selectedTheme == .default(defaultColor)) {
                        themeManager.selectTheme(.default(defaultColor))
                    }
                }
            }
            
            Section(header: Text("Custom Colors")) {
                ForEach(themeManager.customColors) { customColor in
                    ThemeRow(theme: .custom(customColor), isSelected: themeManager.selectedTheme == .custom(customColor)) {
                        themeManager.selectTheme(.custom(customColor))
                    }
                }
                .onDelete(perform: themeManager.removeCustomColor)
                
            }
            
            if themeManager.customColors.count < 10 {
                Section(header: Text("Add Custom Color")) {
                    Button {
                        showingAddCustomColor = true
                    } label: {
                        Label("Add Custom Color", systemImage: "plus")
                    }
                }
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("App Theme")
                    .fontWeight(.semibold)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingAddCustomColor) {
            AddCustomColorView(themeManager: themeManager)
        }
    }
}

struct ThemeRow: View {
    let theme: ThemeColor
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        HStack {
            Label(theme.name, systemImage: isSelected ? "circle.fill" : "circle")
                .foregroundStyle(theme.color)
            if case .custom(let customColor) = theme {
                Text("#\(customColor.hexCode)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(theme.color)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: action)
    }
}

// MARK: - Preview
#Preview {
    ThemeSelectionView(themeManager: ThemeManager())
}
