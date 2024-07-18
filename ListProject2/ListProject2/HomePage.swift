//
//  HomePage.swift
//  ListProject2
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct HomePage: View {
    
    @Binding var themeColor: Int
    
    @State private var infoPopup:Bool = false
    @State private var settingsPopUp:Bool = false
    
    var body: some View {
        NavigationView {
            Text("Hello World")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        HStack {
                            Button {
                                settingsPopUp.toggle()
                            } label: {
                                Label("Settings", systemImage: "gear")
                            }
                            
                            
                        }
                    }
                    ToolbarItemGroup(placement: .principal) {
                        Text("New App")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(themeColor == 1 ? .red : .blue)
                    }
                    
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            infoPopup.toggle()
                        } label: {
                            Label("Information", systemImage: "info.circle.fill")
                        }
                    }

                }
        }
        .popover(isPresented: $infoPopup, content: {
            InfoPopUp(themeColor: $themeColor)
        })
        .popover(isPresented: $settingsPopUp, content: {
            SettingsView()
        })
    }
    
}

struct Preview_Views: PreviewProvider {
    static var previews: some View {
        HomePage(themeColor: .constant(1))
    }
}
