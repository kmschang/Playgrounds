//
//  AppearanceSettingsView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import SwiftUI

struct AppearanceSettingsView: View {
    @ObservedObject var viewModel: AppearanceViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("System")) {
                    AppearanceRow(mode: .automatic, selectedMode: $viewModel.selectedMode)
                }
                
                Section(header: Text("Manual Selection")) {
                    ForEach(AppearanceMode.allCases.filter { $0 != .automatic }, id: \.self) { mode in
                        AppearanceRow(mode: mode, selectedMode: $viewModel.selectedMode)
                    }
                }
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("App Appearance")
                    .fontWeight(.semibold)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AppearanceRow: View {
    let mode: AppearanceMode
    @Binding var selectedMode: AppearanceMode
    
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        HStack {
            Text(mode == .automatic ? "System" : mode.rawValue.capitalized)
            Spacer()
            if selectedMode == mode {
                Image(systemName: "checkmark")
                    .foregroundColor(themeManager.selectedTheme.color)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            selectedMode = mode
        }
    }
}

struct AppearanceSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppearanceSettingsView(viewModel: AppearanceViewModel())
                .previewDisplayName("Light Mode")
                .environmentObject(ThemeManager())

            
            AppearanceSettingsView(viewModel: AppearanceViewModel())
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
                .environmentObject(ThemeManager())
        }
    }
}
