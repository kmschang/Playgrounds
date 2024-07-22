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
                Section(header: Text("Automatic")) {
                    AppearanceRow(mode: .automatic, selectedMode: $viewModel.selectedMode)
                }
                
                Section(header: Text("Default Appearances")) {
                    ForEach(AppearanceMode.allCases.filter { $0 != .automatic }, id: \.self) { mode in
                        AppearanceRow(mode: mode, selectedMode: $viewModel.selectedMode)
                    }
                }
            }
            .navigationTitle("Appearance Settings")
        }
    }
}

struct AppearanceRow: View {
    let mode: AppearanceMode
    @Binding var selectedMode: AppearanceMode
    
    var body: some View {
        HStack {
            Text(mode.rawValue.capitalized)
            Spacer()
            if selectedMode == mode {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
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
            
            AppearanceSettingsView(viewModel: AppearanceViewModel())
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
