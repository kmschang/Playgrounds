//
//  PDFKitView.swift
//  FillingFormsTesting
//
//  Created by Kyle Schang on 8/7/24.
//

import Foundation
import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {
    let url: URL
    let description: String
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        if let filledDocument = fillPDFFields(url: self.url, description: self.description) {
            pdfView.document = filledDocument
        } else {
            pdfView.document = PDFDocument(url: self.url)
        }
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        // Update if needed
    }
}
