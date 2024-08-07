//
//  ContentView.swift
//  PostgreSQLTesting
//
//  Created by Kyle Schang on 8/7/24.
//

import SwiftUI
import PostgresClientKit



struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear(perform: {
            do {
                var configuration = PostgresClientKit.ConnectionConfiguration()
                configuration.host = "100.126.152.112"
                configuration.port = 5432
                configuration.database = "loto"
                configuration.user = "user1"
                configuration.credential = .scramSHA256(password: "lanyard.pygmy7ARTICLE")

                let connection = try PostgresClientKit.Connection(configuration: configuration)
                defer { connection.close() }

                let text = "SELECT * FROM users LIMIT 1000;"
                let statement = try connection.prepareStatement(text: text)
                defer { statement.close() }

                let cursor = try statement.execute(parameterValues: [ "FAILED" ])
                defer { cursor.close() }

                for row in cursor {
                    let columns = try row.get().columns
                    let username = try columns[1].string()
                    let email = try columns[2].string()
                    let firstName = try columns[3].string()
                    let lastName = try columns[4].string()
                
                    
                
                    print("\(username), \(email), \(firstName), \(lastName)")
                }
            } catch {
                print(error)
                print("FAILED")
                print("Error: \(error.localizedDescription)")
            }
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
