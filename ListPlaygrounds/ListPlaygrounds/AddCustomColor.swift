import SwiftUI
import Combine

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

struct AddCustomColor: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var customColors: [CustomColors]
    @State private var customName: String
    @State private var customHEX: String
    
    private let textLimit = 6
    private let hexCharacterSet = CharacterSet(charactersIn: "0123456789ABCDEF").inverted
    
    func limitText(_ upper: Int) {
        if customHEX.count > upper {
            customHEX = String(customHEX.prefix(upper))
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Custom Color")) {
                    TextField("Custom Color Name", text: $customName)
                        .modifier(TextFieldClearButton(text: $customName))
                    TextField("Custom Color HEX", text: $customHEX)
                        .modifier(TextFieldClearButton(text: $customHEX))
                        .onReceive(Just(customHEX)) { newValue in
                            let filtered = newValue.uppercased().components(separatedBy: hexCharacterSet).joined()
                            if filtered != newValue {
                                self.customHEX = filtered
                            }
                            limitText(textLimit)
                        }
                }
                
                Section(header: Text("Custom Color Preview")) {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color(hex: customHEX))
                        .frame(width: UIScreen.main.bounds.size.width / 1.25, height: UIScreen.main.bounds.size.width / 1.25, alignment: .center)
                        .listRowBackground(Color.white.opacity(0))
                }
                
                Section {
                    Button() {
                        if (customHEX.count == 6) {
                            let newCustomColor = CustomColors(colorName: customName, colorHEX: customHEX, isSelected: false)
                            withAnimation {
                                customColors.append(newCustomColor)
                            }
                            dismiss()
                        } else {
                            dismiss()
                        }
                    } label: {
                        HStack {
                            Spacer()
                            withAnimation {
                                Text(customHEX.count == 6 ? "Save" : "Cancel")
                            }
                            Spacer()
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(false)
            .navigationTitle("Add Custom Color")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark.circle.fill")
                    }
                }
            }
        }
    }
    
    init(customColors: Binding<[CustomColors]>, customName: String, customHEX: String) {
        self._customColors = customColors
        self._customName = State(initialValue: customName)
        self._customHEX = State(initialValue: customHEX)
    }
    
}

#Preview {
    AddCustomColor(customColors: .constant([CustomColors(colorName: "Example", colorHEX: "FFFFFF", isSelected: false)]), customName: "New Color", customHEX: "FF0000")
}

