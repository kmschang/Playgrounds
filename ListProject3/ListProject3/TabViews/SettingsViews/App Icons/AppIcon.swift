//
//  AppIcon.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import Foundation

enum AppIcon: String, CaseIterable, Identifiable {
    case `default` = "DefaultAppIcon"
    case red = "RedAppIcon"
    case orange = "OrangeAppIcon"
    case yellow = "YellowAppIcon"
    case green = "GreenAppIcon"
    case blue = "BlueAppIcon"
    case purple = "PurpleAppIcon"
    case black = "BlackAppIcon"
    case white = "WhiteAppIcon"
    
    var id: String { rawValue }
    
    var previewName: String {
        self == .default ? "DefaultAppIcon_Preview" : "\(rawValue)_Preview"
    }
    
    var displayName: String {
        switch self {
        case .default:
            return "Default"
        default:
            return rawValue.replacingOccurrences(of: "AppIcon", with: "").capitalized
        }
    }
}
