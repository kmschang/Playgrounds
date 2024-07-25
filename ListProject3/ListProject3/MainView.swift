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
                
                
                
                
            }
            .toolbarBackground(Color(hex: colorScheme == .dark ? "1C1C1E" : "ededed"), for: .navigationBar)
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
