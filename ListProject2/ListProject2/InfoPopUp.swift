//
//  InfoPopUp.swift
//  ListProject2
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct InfoPopUp: View {
    
    @Binding var themeColor: Int

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Text("Information")
                .navigationTitle("App Information")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.red, for: .navigationBar)
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
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

#Preview {
    InfoPopUp(themeColor: .constant(1))
}
