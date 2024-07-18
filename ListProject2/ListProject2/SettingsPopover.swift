//
//  SettingsPopover.swift
//  ListProject2
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct SettingsPopover: View {
    
    @Binding var themeColor: Int
    
    @Environment(\.dismiss) var dismiss
    
    @State private var settings = Settings.preview()
    
    @State private var searchTerm:String = ""
        
    var body: some View {
        NavigationStack {
            List(settings) {setting in
                Section {
                    NavigationLink(destination: InfoPopUp(themeColor: .constant(1))) {
                        Label(setting.settingName, systemImage: setting.settingIcon)
                        Text(setting.settingName)
                    }
                } footer: {
                    Text(setting.settingDescription)
                }
            }
            .navigationTitle("Settings")
            .searchable(text: $searchTerm, prompt: "Search Settings")
        }
    }
}

#Preview {
    SettingsPopover(themeColor: .constant(1))
}
