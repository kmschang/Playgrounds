//
//  AppearanceManager.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/19/24.
//

import Foundation
import SwiftUI

class AppearanceManager: ObservableObject {
    @Published var selectedTheme: Theme {
        didSet {
            saveTheme()
        }
    }
    
    init() {
        if let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme"), let theme = Theme(rawValue: savedTheme) {
            self.selectedTheme = theme
        } else {
            self.selectedTheme = .auto
        }
    }
    
    private func saveTheme() {
        UserDefaults.standard.set(selectedTheme.rawValue, forKey: "selectedTheme")
    }
}
