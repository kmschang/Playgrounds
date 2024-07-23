//
//  TodayView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import SwiftUI

struct TodayView: View {
    
    @EnvironmentObject var themeManager: ThemeManager
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        
        let lightGray:Color = Color(red: 0.90, green: 0.90, blue: 0.90, opacity: 1.00)
        let darkGray:Color = Color(red: 0.10, green: 0.10, blue: 0.10, opacity: 1.00)
        
        NavigationStack {
            
            GeometryReader { fullScreen in
                
                let fullHeight = fullScreen.size.height
                let fullWidth = fullScreen.size.width
                
                VStack(spacing: 0) {
                    
                    HStack {
                        Spacer()
                        VStack(spacing: 0) {
                            Text("Day")
                                .font(.system(size: fullHeight / 24, weight: .bold))
                            Text("204")
                                .font(.system(size: fullHeight / 6, weight: .black))
                                .foregroundStyle(themeManager.selectedTheme.color)
                        }
                        .frame(width: fullWidth - fullWidth / 16, height: fullHeight * (4 / 7))
                        .background (
                            RoundedRectangle(cornerRadius: 25)
                                .fill(colorScheme == .dark ? darkGray : lightGray)
                        )
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        VStack(spacing: 0) {
                            Text("Monday")
                                .font(.system(size: fullHeight / 22, weight: .bold))
                            Text("07/22/24")
                                .font(.system(size: fullHeight / 14, weight: .black))
                                .foregroundStyle(themeManager.selectedTheme.color)
                        }
                        .frame(width: fullWidth - fullWidth / 16, height: fullHeight * (1.25 / 7))
                        .background (
                            RoundedRectangle(cornerRadius: 25)
                                .fill(colorScheme == .dark ? darkGray : lightGray)
                        )
                        Spacer()
                    }
                    
                    VStack {
                        
                        HStack {
                            HStack {
                                Text("Day")
                                    .font(.system(size: fullHeight / 22, weight: .bold))
                                Spacer()
                                Text("204")
                                    .font(.system(size: fullHeight / 18, weight: .black))
                                    .foregroundStyle(themeManager.selectedTheme.color)
                            }
                            .padding()
                            .frame(width: fullWidth / 2 - fullWidth / 16, height: fullHeight * (0.875 / 7))
                            .background (
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(colorScheme == .dark ? darkGray : lightGray)
                            )
                            Spacer()
                            HStack {
                                Text("Week")
                                    .font(.system(size: fullHeight / 22, weight: .bold))
                                Spacer()
                                Text("30")
                                    .font(.system(size: fullHeight / 18, weight: .black))
                                    .foregroundStyle(themeManager.selectedTheme.color)
                            }
                            .padding()
                            .frame(width: fullWidth / 2 - fullWidth / 16, height: fullHeight * (0.875 / 7))
                            .background (
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(colorScheme == .dark ? darkGray : lightGray)
                            )
                        }
                        
                        HStack {
                            
                            
                        }
                        
                        
                    }
                    
                    
                }
                    
    
                    
            }
                
                
                
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("Day Calculator")
                    .fontWeight(.semibold)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
    }


// MARK: - Preview
struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample ThemeManager for the preview
        let themeManager = ThemeManager()
        themeManager.selectedTheme = .default(.blue) // Set a default theme for the preview
        
        // Create a sample AppearanceViewModel for the preview
        let appearanceViewModel = AppearanceViewModel()
        
        return ContentView()
            .environmentObject(themeManager) // Inject the sample ThemeManager
            .environmentObject(appearanceViewModel) // Inject the sample AppearanceViewModel
    }
}
