//
//  ColorModel.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/19/24.
//

import Foundation
import SwiftUI

struct CustomColor: Identifiable, Codable {
    let id: UUID
    let name: String
    let hexCode: String
    
    var color: Color {
        Color(hex: hexCode)
    }
}

enum ThemeColor: Identifiable, Codable, Equatable {
    static func == (lhs: ThemeColor, rhs: ThemeColor) -> Bool {
            switch (lhs, rhs) {
            case (.auto, .auto):
                return true
            case (.default(let lhsColor), .default(let rhsColor)):
                return lhsColor == rhsColor
            case (.custom(let lhsColor), .custom(let rhsColor)):
                return lhsColor.id == rhsColor.id
            default:
                return false
            }
        }
    
    case auto
    case `default`(DefaultColor)
    case custom(CustomColor)
    
    var id: String {
        switch self {
        case .auto:
            return "auto"
        case .default(let color):
            return "default_\(color.rawValue)"
        case .custom(let color):
            return color.id.uuidString
        }
    }
    
    var name: String {
        switch self {
        case .auto:
            return "Auto"
        case .default(let color):
            return color.name
        case .custom(let color):
            return color.name
        }
    }
    
    var color: Color {
        switch self {
        case .auto:
            return .primary // This can be adjusted based on light/dark mode
        case .default(let defaultColor):
            return defaultColor.color
        case .custom(let customColor):
            return customColor.color
        }
    }
}

enum DefaultColor: String, Codable, CaseIterable {
    case red, orange, yellow, green, blue, purple
    
    var name: String { rawValue.capitalized }
    
    var color: Color {
        switch self {
        case .red: return .red
        case .orange: return .orange
        case .yellow: return .yellow
        case .green: return .green
        case .blue: return .blue
        case .purple: return .purple
        }
    }
}
