//
//  AppIconManager.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import Foundation
import SwiftUI

class AppIconManager: ObservableObject {
    @Published var currentIcon: AppIcon = .primary
    
    init() {
        if let iconName = UIApplication.shared.alternateIconName {
            currentIcon = AppIcon(rawValue: iconName) ?? .primary
        }
    }
    
    func changeAppIcon(to icon: AppIcon) {
        let iconName = icon == .primary ? nil : icon.fileName
        UIApplication.shared.setAlternateIconName(iconName) { error in
            if let error = error {
                print("Error changing app icon: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    self.currentIcon = icon
                }
            }
        }
    }
    
    var currentIconPreviewFileName: String {
        return currentIcon.previewFileName
    }
}

