//
//  AppearanceViewModel.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import Foundation
import SwiftUI
import Combine

class AppearanceViewModel: ObservableObject {
    @Published var selectedMode: AppearanceMode = .automatic {
        didSet {
            applyAppearanceMode()
        }
    }
    
    private func applyAppearanceMode() {
        switch selectedMode {
        case .automatic:
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
        case .light:
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
        case .dark:
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
        case .black:
            if #available(iOS 13.0, *) {
                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
                // Additional customization for black mode if needed
            }
        }
    }
}
