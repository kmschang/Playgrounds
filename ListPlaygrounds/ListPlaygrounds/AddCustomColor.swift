import SwiftUI

struct AddCustomColor: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var customColors: [CustomColors]
    @State private var customName: String
    @State private var customHEX: String
    
    init(customColors: Binding<[CustomColors]>, customName: String, customHEX: String) {
        self._customColors = customColors
        self._customName = State(initialValue: customName)
        self._customHEX = State(initialValue: customHEX)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Custom Color")) {
                    TextField("Custom Color Name", text: $customName)
                    TextField("Custom Color HEX Code without #", text: $customHEX)
                }
                
                Section(header: Text("Custom Color Preview")) {
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(Color(hex: customHEX))
                        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width, alignment: .center)
                        .listRowBackground(Color.white.opacity(0))
                }
                
                Section {
                    Button() {
                        if(customName != "" && customHEX != "") {
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
                                Text(customName != "" && customHEX != "" ? "Save Color" : "Cancel")
                            }
                            Spacer()
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(false)
            .navigationTitle("Add Custom Color")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddCustomColor(customColors: .constant([CustomColors(colorName: "Example", colorHEX: "#FFFFFF", isSelected: false)]), customName: "New Color", customHEX: "#FF0000")
}

func verifyHEX(input: String) -> Bool {
    // Working to verify if the input is a hex and if not, then don't let them save the color
}
