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
        
            

                

        VStack{
            
            GeometryReader { fullScreen in
                
                let height = fullScreen.size.height
                
                VStack {
                    
                    // Navigation Bar
                    ZStack {
                        VStack {
                            Rectangle()
                                .fill(colorScheme == .dark ? Color(hex: "252526") : Color(hex: "#F2F2F7"))
                                .frame(height: height / 12)
                                .ignoresSafeArea()
                            Spacer()
                        }
                        VStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(colorScheme == .dark ? Color(hex: "252526") : Color(hex: "#F2F2F7"))
                                .frame(height: height / 8)
                                .ignoresSafeArea()
                            Spacer()
                        }
                        
                        VStack {
                            ZStack {
                                HStack {
                                    Spacer()
                                    Text("Day Calculator")
                                        .font(.system(size: 20, weight: .semibold))
                                    Spacer()
                                }
                                
                                HStack {
                                    Button {
                                        settingsPopUp.toggle()
                                    } label: {
                                        Image(systemName: "gear")
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                    Spacer()
                                }
                                .padding(.horizontal, 20)
                                
                                HStack(spacing: 20) {
                                    Spacer()
                                    Button {
                                        timeMachinePopUp.toggle()
                                    } label: {
                                        Image(systemName: "clock.arrow.2.circlepath")
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                    
                                    Button {
                                        durationPopUp.toggle()
                                    } label: {
                                        Image(systemName: "timelapse")
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                            Spacer()
                        }
                    }
                    
                    
                    // Body
                    
                    RoundedRectangle(cornerRadius: 25)
                    
                    
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
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
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
