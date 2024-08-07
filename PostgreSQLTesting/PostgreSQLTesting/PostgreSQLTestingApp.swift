//
//  PostgreSQLTestingApp.swift
//  PostgreSQLTesting
//
//  Created by Kyle Schang on 8/7/24.
//

import SwiftUI
import SQLite3

var dbURL = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String

@main
struct PostgreSQLTestingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func createOpenDatabase() -> OpaquePointer? {
        
        var db: OpaquePointer?
        
        let url = NSURL(fileURLWithPath: dbURL)
        
    }
    
}
