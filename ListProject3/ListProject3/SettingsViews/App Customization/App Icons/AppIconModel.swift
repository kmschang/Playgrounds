//
//  AppIconModel.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import Foundation
import SwiftUI

class AppIconViewModel: ObservableObject {
    @Published var currentIcon: AppIcon
    
    init() {
        if let iconName = UIApplication.shared.alternateIconName,
           let icon = AppIcon(rawValue: iconName) {
            currentIcon = icon
        } else {
            currentIcon = .default
        }
    }
    
    func changeIcon(to newIcon: AppIcon) {
        let iconName = newIcon == .default ? nil : newIcon.rawValue
        UIApplication.shared.setAlternateIconName(iconName) { error in
            if let error = error {
                print("Error changing app icon: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    self.currentIcon = newIcon
                    UserDefaults.standard.set(newIcon.rawValue, forKey: "selectedAppIcon")
                }
            }
        }
    }
    
    func getCurrentIconPreviewName() -> String {
        currentIcon.previewName
    }
}
