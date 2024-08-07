//
//  ContentView.swift
//  FillingFormsTesting
//
//  Created by Kyle Schang on 8/7/24.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    @State private var showPopup: Bool = false
    @State private var name: String = ""
    
    var body: some View {
        List {
            Section(header: Text("Add Information")) {
                TextField("Name", text: $name)
                Button {
                    showPopup.toggle()
                } label: {
                    Label("Export to PDF", systemImage: "filemenu.and.selection")
                }
            }
        }
        .sheet(isPresented: $showPopup, content: {
            if let url = Bundle.main.url(forResource: "LOTO", withExtension: "pdf") {
                PDFKitView(url: url, description: name)
            } else {
                Text("PDF not found")
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



func fillPDFFields(url: URL, description: String) -> PDFDocument? {
    guard let document = PDFDocument(url: url) else { return nil }
    
    for i in 0..<document.pageCount {
        if let page = document.page(at: i) {
            for annotation in page.annotations {
                if annotation.fieldName == "Description" {
                    annotation.widgetStringValue = description
                }
                if annotation.fieldName == "ProcedureNumber" {
                    annotation.widgetStringValue = description
                }
            }
        }
    }
    
    return document
}
