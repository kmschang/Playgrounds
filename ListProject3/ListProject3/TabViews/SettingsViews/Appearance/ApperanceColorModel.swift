//
//  ApperanceColorModel.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/19/24.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    case auto = "Auto"
    case light = "Light"
    case dark = "Dark"
    case black = "Black"
    case sepia = "Sepia"
    
    var id: String { self.rawValue }
    
    var backgroundColor: Color {
        switch self {
        case .auto: return .clear
        case .light: return .white
        case .dark: return .gray
        case .black: return .black
        case .sepia: return Color(red: 244/255, green: 232/255, blue: 210/255)
        }
    }
    
    var listBackgroundColor: Color {
        switch self {
        case .auto: return .clear
        case .light: return Color(white: 0.95)
        case .dark: return Color(white: 0.3)
        case .black: return Color(white: 0.1)
        case .sepia: return Color(red: 250/255, green: 240/255, blue: 230/255)
        }
    }
}
