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
    @Published var selectedTheme: ThemeColor = .auto {
        didSet {
            saveTheme()
        }
    }
    @Published var customColors: [CustomColor] = [] {
        didSet {
            saveCustomColors()
        }
    }
    
    private let userDefaults = UserDefaults.standard
    private let selectedThemeKey = "selectedTheme"
    private let customColorsKey = "customColors"
    
    init() {
        loadCustomColors()
        loadTheme()
    }
    
    func selectTheme(_ theme: ThemeColor) {
        selectedTheme = theme
    }
    
    func addCustomColor(name: String, hexCode: String) {
        guard customColors.count < 10 else { return }
        let newColor = CustomColor(id: UUID(), name: name, hexCode: hexCode)
        customColors.append(newColor)
    }
    
    func removeCustomColor(at offsets: IndexSet) {
        let colorsToRemove = offsets.map { customColors[$0] }
        customColors.remove(atOffsets: offsets)
        
        // Check if the selected theme is one of the removed colors
        if case .custom(let selectedCustomColor) = selectedTheme,
           colorsToRemove.contains(where: { $0.id == selectedCustomColor.id }) {
            selectedTheme = .auto
        }
    }
    
    private func saveTheme() {
        if let encoded = try? JSONEncoder().encode(selectedTheme) {
            userDefaults.set(encoded, forKey: selectedThemeKey)
        }
    }
    
    private func loadTheme() {
        if let savedTheme = userDefaults.data(forKey: selectedThemeKey),
           let decodedTheme = try? JSONDecoder().decode(ThemeColor.self, from: savedTheme) {
            // Validate the loaded theme
            switch decodedTheme {
            case .auto, .default:
                selectedTheme = decodedTheme
            case .custom(let customColor):
                if customColors.contains(where: { $0.id == customColor.id }) {
                    selectedTheme = decodedTheme
                } else {
                    selectedTheme = .auto
                }
            }
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
