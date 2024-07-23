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
        
        let lighterGray:Color = Color(red: 0.80, green: 0.80, blue: 0.80, opacity: 1.00)
        let darkerGray:Color = Color(red: 0.20, green: 0.20, blue: 0.20, opacity: 1.00)
        
        NavigationStack {
            
            GeometryReader { fullScreen in
                
                let fullHeight = fullScreen.size.height
                let fullWidth = fullScreen.size.width
                
                VStack {
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            VStack {
                                Text("Day")
                                    .font(.system(size: fullHeight / 18, weight: .bold))
                                Text("204")
                                    .font(.system(size: fullHeight / 6, weight: .black))
                                    .foregroundStyle(themeManager.selectedTheme.color)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    .frame(height: fullHeight / 1.75)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(colorScheme == .dark ? darkGray : lightGray)
                    )
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("07/22/24")
                                .font(.system(size: fullHeight / 10, weight: .black))
                                .foregroundStyle(themeManager.selectedTheme.color)
                            Spacer()
                        }
                        Spacer()
                    }
                    .frame(height: fullHeight / 4.5 - fullHeight / 32)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(colorScheme == .dark ? darkGray : lightGray)
                    )
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            
                            sliderContent(label: "Week", data: "30", frameHeight: fullHeight / 4.5, frameWidth: fullWidth / 2.5, labelTextHeight: fullHeight / 28, dataTextHeight: fullHeight / 20, frameSpacing: fullHeight / 32)
                            
                            sliderContent(label: "Month", data: "7", frameHeight: fullHeight / 4.5, frameWidth: fullWidth / 2.5, labelTextHeight: fullHeight / 28, dataTextHeight: fullHeight / 20, frameSpacing: fullHeight / 32)
                            
                            
                            sliderContent(label: "Day", data: "204", frameHeight: fullHeight / 4.5, frameWidth: fullWidth / 2.5, labelTextHeight: fullHeight / 28, dataTextHeight: fullHeight / 20, frameSpacing: fullHeight / 32)
                            
                            
                            sliderContent(label: "Year", data: "2024", frameHeight: fullHeight / 4.5, frameWidth: fullWidth / 2.5, labelTextHeight: fullHeight / 28, dataTextHeight: fullHeight / 20, frameSpacing: fullHeight / 32)
                            
                            sliderContent(label: "Weekday", data: "Monday", frameHeight: fullHeight / 4.5, frameWidth: fullWidth / 2.5, labelTextHeight: fullHeight / 28, dataTextHeight: fullHeight / 20, frameSpacing: fullHeight / 32)
                            
            
                        }
                    }
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                    )

                    
                    
                    
                    
                    
                }
                .padding(fullWidth / 32)
                
                
                
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


struct sliderContent: View {
    
    let label:String
    let data:String
    
    let frameHeight: CGFloat
    let frameWidth: CGFloat
    let labelTextHeight: CGFloat
    let dataTextHeight: CGFloat
    let frameSpacing:CGFloat
    
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Text(label)
                        .font(.system(size: labelTextHeight, weight: .bold))
                    Text(data)
                        .font(.system(size: dataTextHeight, weight: .black))
                        .foregroundStyle(themeManager.selectedTheme.color)
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
        .frame(minWidth: 135, maxWidth: 1000, maxHeight: frameHeight - frameSpacing)
        .frame(height: frameHeight - frameSpacing)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(colorScheme == .dark ? darkGray : lightGray)
        )
        
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
