//
//  AddCustomColorView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/19/24.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "clear")
                            .foregroundStyle(Color.gray)
                    }
                )
            }
        }
    }
}

struct AddCustomColorView: View {
    @ObservedObject var themeManager: ThemeManager
    @State private var colorName = ""
    @State private var hexCode = ""
    @Environment(\.presentationMode) var presentationMode
    
    private let textLimit = 6
    private let hexCharacterSet = CharacterSet(charactersIn: "0123456789ABCDEF").inverted
    
    func limitText(_ upper: Int) {
        if hexCode.count > upper {
            hexCode = String(hexCode.prefix(upper))
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                
            
                
                Section {
                    TextField("Color Name", text: $colorName)
                        .modifier(TextFieldClearButton(text: $colorName))
                    TextField("Hex Code", text: $hexCode)
                        .modifier(TextFieldClearButton(text: $hexCode))
                        .onChange(of: hexCode, { oldValue, newValue in
                            let filtered = newValue.uppercased().components(separatedBy: hexCharacterSet).joined()
                            if filtered != newValue {
                                self.hexCode = filtered
                            }
                            limitText(textLimit)
                        })
                } header: {
                    Text("Add Custom Color")
                }
                

                Section {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color(hex: hexCode))
                        .frame(width: UIScreen.main.bounds.size.width / 1.25, height: UIScreen.main.bounds.size.width / 1.25, alignment: .center)
                        .listRowBackground(Color.white.opacity(0))
                } header: {
                    Text("Custom Color Preview")
                }

                
                Section {
                    HStack {
                        Spacer()
                        Button("Add Color") {
                            themeManager.addCustomColor(name: colorName, hexCode: hexCode)
                            presentationMode.wrappedValue.dismiss()
                        }
                        .disabled(!isValidColorName(colorName) || !isValidHexCode(hexCode))
                        Spacer()
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Label("Back", systemImage: "chevron.down")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Add Custom Color")
                        .fontWeight(.semibold)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private func isValidColorName(_ name: String) -> Bool {
    if (name == "") {
        return false
    } else {
        let regex = try! NSRegularExpression(pattern: "^[A-Za-z0-9\\s\\-_]{1,20}$")
        let range = NSRange(location: 0, length: name.utf16.count)
        return regex.firstMatch(in: name, options: [], range: range) != nil
    }
}

private func isValidHexCode(_ code: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[A-Za-z0-9]{6}$")
    let range = NSRange(location: 0, length: code.utf16.count)
    return regex.firstMatch(in: code, options: [], range: range) != nil
}


#Preview {
    AddCustomColorView(themeManager: ThemeManager())
}
