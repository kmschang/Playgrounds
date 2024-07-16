//
//  Lists.swift
//  SwiftUIPlayground
//
//  Created by Kyle Schang on 7/16/24.
//

import SwiftUI




struct Lists: View {
    
    @State var username:String = ""
    @State var privateAcctount:Bool = true
    
    @State var fontSize:CGFloat = 12
    
    var body: some View {
        Section {
            TextField("Username", text:$username)
            Toggle("Private Account", isOn: $privateAcctount)
        } header: {
            Text("Profile")
        }
        
        Section {
            Slider(value: $fontSize, in: 1...24) {
                Label("Default Font Size", systemImage: "text.magnifyingglass")
            }
        }
    }
}

#Preview {
    Lists()
}
