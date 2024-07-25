//
//  MainView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/25/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = DateViewModel()
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var settingsPopUp:Bool = false
    @State private var timeMachinePopUp:Bool = false
    @State private var durationPopUp:Bool = false

    
    var body: some View {
        
        let darkGray:Color = Color(hex: "1C1C1C")
        let lightGray:Color = Color(hex: "EDEDED")

                

        VStack{
            
            GeometryReader { fullScreen in
                
                let height = fullScreen.size.height
                
                VStack(spacing: height * (2 / 100)) {
                    
<<<<<<< HEAD
                    RoundedRectangle(cornerRadius: 25)
                        .fill(colorScheme == .dark ? darkGray : lightGray)
                        .frame(height: height * (18 / 100))
||||||| 75a7c7d (testing week views)
                                        
                    CurrentWeekView(dateViewModel: dateViewModel)

=======
                    
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(colorScheme == .dark ? darkGray : lightGray)
                        .frame(height: height * (18 / 100))
                        .overlay {
                            VStack {
                                Text("\(dateViewModel.dateInfo.monthOfYear)")
                                    .font(.system(size: height * (4 / 100), weight: .bold))
                                    .foregroundStyle(themeManager.selectedTheme.color)
                                
                                GeometryReader { slider in
                                    
                                    let width = slider.size.width
                                    
                                    
                                }

                            }.padding(.vertical, height * (1 / 100))
                        }
>>>>>>> parent of 75a7c7d (testing week views)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(colorScheme == .dark ? darkGray : lightGray)
                        .frame(height: height * (36 / 100))
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(colorScheme == .dark ? darkGray : lightGray)
                        .frame(height: height * (25 / 100))
                    
                    HStack(spacing: height * (2 / 100)) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(colorScheme == .dark ? darkGray : lightGray)
                            .frame(height: height * (15 / 100))
                        
                        RoundedRectangle(cornerRadius: 25)
                            .fill(colorScheme == .dark ? darkGray : lightGray)
                            .frame(height: height * (15 / 100))
                    }
                    
                }
                
                
            }
            .padding(12)
            .toolbarBackground(colorScheme == .dark ? darkGray : lightGray, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        settingsPopUp.toggle()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundStyle(themeManager.selectedTheme.color)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 10) {
                        Button {
                            timeMachinePopUp.toggle()
                        } label: {
                            Image(systemName: "clock.arrow.2.circlepath")
                                .foregroundStyle(themeManager.selectedTheme.color)
                        }
                        Button {
                            durationPopUp.toggle()
                        } label: {
                            Image(systemName: "timelapse")
                                .foregroundStyle(themeManager.selectedTheme.color)
                        }
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Day Calculator")
                        .fontWeight(.semibold)
                }
            }
        }
        
        .popover(isPresented: $settingsPopUp, content: {
            NavigationView {
                SettingsView(themeManager2: ThemeManager())
                        .environmentObject(themeManager)
            }
        })
        .popover(isPresented: $timeMachinePopUp, content: {
            NavigationView {
                
            }
        })
        .popover(isPresented: $durationPopUp, content: {
            NavigationView {
                
            }
        })
        .tint(themeManager.selectedTheme.color)
        
        
        
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
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
