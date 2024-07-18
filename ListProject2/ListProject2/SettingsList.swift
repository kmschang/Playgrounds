//
//  SettingsList.swift
//  ListProject2
//
//  Created by Kyle Schang on 7/18/24.
//

import Foundation
import SwiftUI

struct Settings: Identifiable {
    
    var settingName: String
    var settingDescription: String
    var settingIcon: String
    let id = UUID()
    
    static func preview() -> [Settings] {
        [Settings(settingName: "Account", settingDescription: "Account", settingIcon: "house"), Settings(settingName: "Theme", settingDescription: "Theme", settingIcon: "gear")]
    }
    
    
}



