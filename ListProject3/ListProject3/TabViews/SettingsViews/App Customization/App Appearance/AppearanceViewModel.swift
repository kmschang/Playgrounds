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
            setUserInterfaceStyle(.unspecified)
        case .light:
            setUserInterfaceStyle(.light)
        case .dark:
            setUserInterfaceStyle(.dark)
        }
    }
    
    private func setUserInterfaceStyle(_ style: UIUserInterfaceStyle) {
        if #available(iOS 15.0, *) {
            // Use the new API for iOS 15 and later
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first else { return }
            window.overrideUserInterfaceStyle = style
        } else {
            // Fallback for earlier iOS versions
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = style
        }
    }
}
