//
//  ThemeManager.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/19/24.
//

import Foundation
import SwiftUI
import Combine

// MARK: - Theme Manager
class ThemeManager: ObservableObject {
    @Published var selectedTheme: ThemeColor = .auto
    @Published var customColors: [CustomColor] = []
    
    private let userDefaults = UserDefaults.standard
    private let selectedThemeKey = "selectedTheme"
    private let customColorsKey = "customColors"
    
    init() {
        loadTheme()
        loadCustomColors()
    }
    
    func selectTheme(_ theme: ThemeColor) {
        selectedTheme = theme
        saveTheme()
    }
    
    func addCustomColor(name: String, hexCode: String) {
        guard customColors.count < 10 else { return }
        let newColor = CustomColor(id: UUID(), name: name, hexCode: hexCode)
        customColors.append(newColor)
        saveCustomColors()
    }
    
    func removeCustomColor(at offsets: IndexSet) {
        for index in offsets {
            let colorToDelete = customColors[index]
            if selectedTheme == .custom(colorToDelete) {
                selectedTheme = .auto // or select a default color
            }
        }
        customColors.remove(atOffsets: offsets)
    }
    
    private func saveTheme() {
        if let encoded = try? JSONEncoder().encode(selectedTheme) {
            userDefaults.set(encoded, forKey: selectedThemeKey)
        }
    }
    
    private func loadTheme() {
        if let savedTheme = userDefaults.data(forKey: selectedThemeKey),
           let decodedTheme = try? JSONDecoder().decode(ThemeColor.self, from: savedTheme) {
            selectedTheme = decodedTheme
        }
    }
    
    private func saveCustomColors() {
        if let encoded = try? JSONEncoder().encode(customColors) {
            userDefaults.set(encoded, forKey: customColorsKey)
        }
    }
    
    private func loadCustomColors() {
        if let savedColors = userDefaults.data(forKey: customColorsKey),
           let decodedColors = try? JSONDecoder().decode([CustomColor].self, from: savedColors) {
            customColors = decodedColors
        }
    }
}
