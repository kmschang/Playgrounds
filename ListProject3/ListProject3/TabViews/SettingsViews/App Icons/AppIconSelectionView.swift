//
//  AppIconSelectionView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import SwiftUI

struct AppIconView: View {
    @StateObject private var iconManager = AppIconManager()
    
    var body: some View {
        List {
            Section(header: Text("Default")) {
                AppIconList(icon: .primary, iconManager: iconManager)
            }
            
            Section(header: Text("Color Options")) {
                ForEach(AppIcon.allCases.filter { $0 != .primary }) { icon in
                    AppIconList(icon: icon, iconManager: iconManager)
                }
            }
        }
        .navigationTitle("App Icons")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AppIconList: View {
    let icon: AppIcon
    @ObservedObject var iconManager: AppIconManager
    
    var body: some View {
        HStack {
            Image(icon.previewfileName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            
            Text(icon.name)
            
            Spacer()
            
            if iconManager.currentIcon == icon {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            iconManager.changeAppIcon(to: icon)
        }
    }
}

struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppIconView()
        }
    }
}
