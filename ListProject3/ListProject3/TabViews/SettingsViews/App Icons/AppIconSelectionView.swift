//
//  AppIconSelectionView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import SwiftUI

struct AppIconSelectionView: View {
    @StateObject private var viewModel = AppIconViewModel()
    
    var body: some View {
        List {
            Section(header: Text("Default")) {
                iconRow(for: .default)
            }
            
            Section(header: Text("Color Options")) {
                ForEach(AppIcon.allCases.filter { $0 != .default }, id: \.self) { icon in
                    iconRow(for: icon)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("App Icon")
                    .fontWeight(.semibold)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func iconRow(for icon: AppIcon) -> some View {
        HStack {
            Image(icon.previewName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .padding(.trailing, 5)
            
            Text(icon.displayName)
            
            Spacer()
            
            if viewModel.currentIcon == icon {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }
        }
        .onTapGesture {
            viewModel.changeIcon(to: icon)
        }
    }
}

#Preview {
    AppIconSelectionView()
}
