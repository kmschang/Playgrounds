//
//  SettingsView.swift
//  ListProject2
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct SettingsView: View {

    @Environment(\.dismiss) var dismiss
    
    @State private var searchText:String = ""
    
    var filteredSettings: [SettingSection: [Setting]] {
        var result: [SettingSection: [Setting]] = [:]
        
        for section in SettingSection.allCases {
            result[section] = section.settings.filter {
                searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return result
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(SettingSection.allCases, id: \.self) { section in
                    if let settings = filteredSettings[section], !settings.isEmpty {
                        Section(header: Text(section.rawValue)) {
                            ForEach(settings) { setting in
                                NavigationLink(destination: Text(setting.description)) {
                                    HStack {
                                        Image(systemName: setting.icon)
                                            .font(.system(size: 25))
                                        VStack(alignment: .leading) {
                                            Text(setting.title)
                                                .font(.headline)
                                            Text(setting.description)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .searchable(text: $searchText, prompt: "Search Settings")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                }
                
            }
        }
    }
}


#Preview {
    SettingsView()
}
