//
//  ColorData.swift
//  ListProject2
//
//  Created by Kyle Schang on 7/18/24.
//

import Foundation
import SwiftUI

struct Color: Identifiable {
    var colorName: String
    var colorHEX: String
    var isSelected: Bool
    let id = UUID()
}

enum Colors: String, CaseIterable {
    case defaultColor = "Default Color"
    
    var customColors: [Color] {
        switch self {
        case .defaultColor:
            return [
                Color(colorName: "Red", colorHEX: "FF0000", isSelected: false),
                Color(colorName: "Green", colorHEX: "00FF00", isSelected: false),
                Color(colorName: "Blue", colorHEX: "0000FF", isSelected: false)
            ]
        }
    }
}
