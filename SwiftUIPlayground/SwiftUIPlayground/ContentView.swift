//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Kyle Schang on 10/28/23.
//

import SwiftUI



struct ContentView: View {
        
    var body: some View {
        VStack {
            Text("Discount Calculator")
                .font(.system(size: 25, weight: .heavy))
                .frame(width: 400, height: 40, alignment: .center)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
