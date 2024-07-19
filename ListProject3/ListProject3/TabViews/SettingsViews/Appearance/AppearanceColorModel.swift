//
//  AppearanceColorModel.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/19/24.
//

import Foundation
import SwiftUI

enum BackgroundColorOption: String, CaseIterable {
    case auto = "Auto"
    case light = "Light"
    case dark = "Dark"
    case black = "Black"
    case sepia = "Sepia"
    case blue = "Blue"
    
    var color: Color {
        switch self {
        case .auto:
            return Color.clear // Placeholder, handled by system
        case .light:
            return Color.white
        case .dark:
            return Color.black
        case .black:
            return Color.black
        case .sepia:
            return Color(red: 1.0, green: 0.93, blue: 0.79) // Light sepia color
        case .blue:
            return Color.blue.opacity(0.5) // Light blue color
        }
    }
}
