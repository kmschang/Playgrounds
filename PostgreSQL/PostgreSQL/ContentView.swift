//
//  ContentView.swift
//  PostgreSQL
//
//  Created by Kyle Schang on 8/7/24.
//

import SwiftUI
import PostgresClientKit

     

struct ContentView: View {
    
    var configuration = PostgresClientKit.ConnectionConfiguration()
    

    
    
    var body: some View {
    
        
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear {
            do {
                let connection = try PostgresClientKit.Connection(configuration: configuration)
                defer { connection.close() }
                
                // Perform queries here
            } catch {
                print("Error connecting to the database: \(error)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
