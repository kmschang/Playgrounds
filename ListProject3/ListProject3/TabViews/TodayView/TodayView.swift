//
//  TodayView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import SwiftUI

struct TodayView: View {
    
    @EnvironmentObject var themeManager: ThemeManager
    @StateObject private var viewModel = DateViewModel()
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var orientation = UIDeviceOrientation.unknown

    func isLandscape() -> Bool {
        return UIDevice.current.orientation.isLandscape
    }
    
    var body: some View {

        NavigationStack {
            
            Group {
                if isLandscape() {
                    Text("SINGLE")
                } else {
                    NavigationStack {
                        TodayView_Vertical()
                    }
                }
            }
            .onRotate { newOrientation in
                orientation = newOrientation
            }

                
                
                
        }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
    }

//MARK: - iPhone Vertical
struct TodayView_Vertical: View {
    
    @EnvironmentObject var themeManager: ThemeManager
    @StateObject private var viewModel = DateViewModel()
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        
        let lightGray:Color = Color(red: 0.90, green: 0.90, blue: 0.90, opacity: 1.00)
        let darkGray:Color = Color(red: 0.10, green: 0.10, blue: 0.10, opacity: 1.00)
        
        GeometryReader { fullScreen in
            
            let fullHeight = fullScreen.size.height
            let fullWidth = fullScreen.size.width
            
            VStack(spacing: fullHeight / 64) {
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Text("Day")
                                .font(.system(size: fullHeight / 18, weight: .bold))
                            Text("\(viewModel.dateInfo.dayOfYear)")
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
                        Text(viewModel.dateInfo.date)
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
                    HStack(spacing: fullHeight / 64){
                        sliderContent(label: "Month", data: "\(viewModel.dateInfo.monthOfYear)", frameHeight: fullHeight / 4.5, frameWidth: fullWidth / 2.5, minWidth: fullWidth / 2 - fullHeight / 64, labelTextHeight: fullHeight / 28, dataTextHeight: fullHeight / 20, frameSpacing: fullHeight / 32)
                        
                        sliderContent(label: "Week", data: "\(viewModel.dateInfo.weekOfYear)", frameHeight: fullHeight / 4.5, frameWidth: fullWidth / 2.5, minWidth: fullWidth / 2 - fullHeight / 32, labelTextHeight: fullHeight / 28, dataTextHeight: fullHeight / 20, frameSpacing: fullHeight / 32)
                        
                        sliderContent(label: "Year", data: "\(viewModel.dateInfo.year)", frameHeight: fullHeight / 4.5, frameWidth: fullWidth / 2.5, minWidth: fullWidth / 2 - fullHeight / 32, labelTextHeight: fullHeight / 28, dataTextHeight: fullHeight / 20, frameSpacing: fullHeight / 32)
                        
                        sliderContent(label: "Weekday", data: "\(viewModel.dateInfo.weekday)", frameHeight: fullHeight / 4.5, frameWidth: fullWidth / 2.5, minWidth: fullWidth / 2 - fullHeight / 32, labelTextHeight: fullHeight / 28, dataTextHeight: fullHeight / 20, frameSpacing: fullHeight / 32)
                    }
                }
                .clipShape(
                    RoundedRectangle(cornerRadius: 15)
                )

            }
            .padding(fullHeight / 64)

        }
    }
}



//MARK: - Slider Template
struct sliderContent: View {
    
    let label:String
    let data:String
    
    let frameHeight: CGFloat
    let frameWidth: CGFloat
    let minWidth: CGFloat
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
        .frame(minWidth: minWidth, maxWidth: 1000, maxHeight: frameHeight)
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
