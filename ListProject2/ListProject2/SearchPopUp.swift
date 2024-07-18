//
//  SearchPopUp.swift
//  ListProject2
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct SearchPopUp: View {
    
    @Binding var themeColor: Int
    
    @State private var people: [String]: []
    @State private var searchString: String = ""
    
    var filteredPeople: [String] {
        guard !searchString.isEmpty else {return people}
        return people.filter()
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List(0..<100) {
                Text("Row \($0)")
            }
            .searchable(text: $searchString, prompt: "Search")
            .toolbar {
                ToolbarItemGroup(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Close")
                    }
                }
            }
        }
              
    }
    
}


#Preview {
    SearchPopUp(themeColor: .constant(1))
}
