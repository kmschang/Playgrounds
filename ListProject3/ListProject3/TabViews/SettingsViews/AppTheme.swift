//
//  AppTheme.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/19/24.
//

import SwiftUI

struct AppTheme: View {
    
    @State private var showingAlert = false
    
    @Binding var themeColor:Int
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        
        List {
            
            Section {
                
                Button {
                    themeColor = 1
                } label: {
                    Label("Red", systemImage: themeColor == 1 ? "circle.fill" : "circle")
                        .foregroundStyle(.red)
                }
                Button {
                    themeColor = 2
                } label: {
                    Label("Orange", systemImage: themeColor == 2 ? "circle.fill" : "circle")
                        .foregroundStyle(.orange)
                }
                Button {
                    themeColor = 3
                } label: {
                    Label("Yellow", systemImage: themeColor == 3 ? "circle.fill" : "circle")
                        .foregroundStyle(.yellow)
                }
                Button {
                    themeColor = 4
                } label: {
                    Label("Green", systemImage: themeColor == 4 ? "circle.fill" : "circle")
                        .foregroundStyle(.green)
                }
                Button {
                    themeColor = 5
                } label: {
                    Label("Blue", systemImage: themeColor == 5 ? "circle.fill" : "circle")
                        .foregroundStyle(.blue)
                }
                Button {
                    themeColor = 6
                } label: {
                    Label("Purple", systemImage: themeColor == 6 ? "circle.fill" : "circle")
                        .foregroundStyle(.purple)
                }
                Button {
                    themeColor = 7
                } label: {
                    Label("Auto", systemImage: themeColor == 7 ? "circle.fill" : "circle")
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                }
                
            } header: {
                Text("Default Theme Colors")
            } footer: {
                Text("Theme colors provided by the app")
            }
            
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("App Theme")
                    .fontWeight(.semibold)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
        
}

#Preview {
    AppTheme(themeColor: .constant(1))
}
