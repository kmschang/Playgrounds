//
//  AppIconModel.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import Foundation
import SwiftUI

// MARK: - App Icons
enum AppIcon: String, CaseIterable, Identifiable {
    case primary = ""  // Default icon
    case red, orange, yellow, green, blue, purple, black, white
    
    var id: String { self.rawValue }
    
    var name: String {
        switch self {
        case .primary: return "Default App Icon"
        case .red: return "Red App Icon"
        case .orange: return "Orange App Icon"
        case .yellow: return "Yellow App Icon"
        case .green: return "Green App Icon"
        case .blue: return "Blue App Icon"
        case .purple: return "Purple App Icon"
        case .black: return "Black App Icon"
        case .white: return "White App Icon"
        }
    }
    
    var previewFileName: String {
        switch self {
        case .primary: return "RedAppIcon_Preview"  // Assuming this is your default app icon name
        case .red: return "RedAppIcon_Preview"
        case .orange: return "OrangeAppIcon_Preview"
        case .yellow: return "YellowAppIcon_Preview"
        case .green: return "GreenAppIcon_Preview"
        case .blue: return "BlueAppIcon_Preview"
        case .purple: return "PurpleAppIcon_Preview"
        case .black: return "BlackAppIcon_Preview"
        case .white: return "WhiteAppIcon_Preview"
        }
    }
    
    var fileName: String {
        switch self {
        case .primary: return "AppIcon"  // Assuming this is your default app icon name
        case .red: return "RedAppIcon"
        case .orange: return "OrangeAppIcon"
        case .yellow: return "YellowAppIcon"
        case .green: return "GreenAppIcon"
        case .blue: return "BlueAppIcon"
        case .purple: return "PurpleAppIcon"
        case .black: return "BlackAppIcon"
        case .white: return "WhiteAppIcon"
        }
    }
}
