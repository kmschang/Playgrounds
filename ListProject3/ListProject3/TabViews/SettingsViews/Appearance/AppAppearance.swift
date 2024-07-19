//
//  AppAppearance.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/19/24.
//

import SwiftUI


enum Appearance {
    static let auto = Color(.clear)
    static let light = Color(hex: "D3D3D3")
    static let dark = Color(hex: "151515")
    static let black = Color(hex: "000000")
    static let sepia = Color(hex: "FFDDA8")
}

struct AppAppearance: View {
    
    
    
    var body: some View {
        
        NavigationStack {
            List {
                Text("1")
                Text("1")
                Text("1")
                Text("1")
                Text("1")
                Text("1")
                    .listRowBackground(Color.red)
            }
            .background(Color.blue)
            .scrollContentBackground(.hidden)

        }
        
    }
}

#Preview {
    AppAppearance()
}
