//
//  TimeMachineView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/22/24.
//

import SwiftUI
import Foundation


// Create Date
let date = Date()

// Create Date Formatter
let dateFormatter = DateFormatter()

func selectedFormattedDate(chosenDate:Date) -> String {
    dateFormatter.dateFormat = "MM/dd/YY"
    let returnDate = dateFormatter.string(from: chosenDate)
    return returnDate
}

func selectedDay(chosenDate:Date) -> String {
    dateFormatter.dateFormat = "D"
    let returnDate = dateFormatter.string(from: chosenDate)
    return returnDate
}

func selectedWeek(chosenDate:Date) -> String {
    dateFormatter.dateFormat = "w"
    let returnDate = dateFormatter.string(from: chosenDate)
    return returnDate
}

func selectedMonth(chosenDate:Date) -> String {
    dateFormatter.dateFormat = "M"
    let returnDate = dateFormatter.string(from: chosenDate)
    return returnDate
}

func selectedYearLong(chosenDate:Date) -> String {
    dateFormatter.dateFormat = "Y"
    let returnDate = dateFormatter.string(from: chosenDate)
    return returnDate
}

func selectedYearShort(chosenDate:Date) -> String {
    dateFormatter.dateFormat = "YY"
    let returnDate = dateFormatter.string(from: chosenDate)
    return returnDate
}

func selectedYearShort(chosenDate:Date) -> Int {
    dateFormatter.dateFormat = "YY"
    let returnDate = dateFormatter.string(from: chosenDate)
    if let number = Int.parse(from: returnDate) {
        return number
    } else {
        return 0
    }
}

func calendarColor(themeColor:Int, deviceTheme:Int) -> Color {
    switch themeColor {
    case 1:
        return .red
    case 2:
        return .orange
    case 3:
        return .yellow
    case 4:
        return .green
    case 5:
        return .blue
    case 6:
        return .purple
    case 7:
        if deviceTheme == 1 {
            return .black
        } else {
            return .white
        }
    default:
        fatalError()
    }
}

var lightGray:Color = Color(red: 0.90, green: 0.90, blue: 0.90, opacity: 1.00)
var darkGray:Color = Color(red: 0.10, green: 0.10, blue: 0.10, opacity: 1.00)


struct TimeMachineView: View {
    
    @State var selectedDate: Date = Date()
     
    @State private var scale:Double = 1.0
    @State private var scaleEffect:Double = 0.5
     
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @EnvironmentObject var themeManager: ThemeManager

        
    var body: some View {
        
        var themeColor = themeManager.selectedTheme.color
        
        ZStack {
            // Background Color
            Rectangle()
                .fill(colorScheme == .dark ? .black : .white)
                .ignoresSafeArea()
            
            // Title
            VStack {
                Text("Time Machine")
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .font(.system(size: (UIScreen.main.bounds.size.height/25), weight: .heavy))
                    .frame(minHeight: 10, idealHeight: 35, maxHeight: 35, alignment: .center)
                    .padding(.top, 5)
                
                // Top Divider
                Rectangle()
                    .fill(colorScheme == .dark ? .white : .black)
                    .frame(height: 3)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                
                
                VStack {
                    Spacer()
                    DatePicker("Enter your date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .background(colorScheme == .dark ? darkGray : lightGray)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                        .padding(.horizontal, 20)
                        .tint(themeColor)
                        .id(Date())
                    Spacer()
                }
                
                
                VStack {
                    
                    Button {
                        selectedDate = Date()
                    } label: {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .overlay {
                                Text(selectedFormattedDate(chosenDate:selectedDate))
                                    .foregroundStyle(themeColor)
                                    .font(.system(size: (UIScreen.main.bounds.size.height/15.4), weight: .heavy))
                            }
                            .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            .tint(colorScheme == .dark ? darkGray : lightGray)
                            .frame(height: (UIScreen.main.bounds.size.height/11.11), alignment: .center)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 15)
                    }
                        
                    HStack {
                        Button {

                        } label: {
                            VStack {
                                HStack {
                                    Text("Day")
                                        .font(.system(size: (UIScreen.main.bounds.size.height/40), weight: .heavy))
                                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                                    Spacer()
                                    Text("\(selectedDay(chosenDate:selectedDate))")
                                        .font(.system(size: (UIScreen.main.bounds.size.height/40), weight: .heavy))
                                        .foregroundStyle(themeColor)
                                }
                            }
                            .padding((UIScreen.main.bounds.size.height)/928 + 20)
                            .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            .frame(height: (UIScreen.main.bounds.size.height/15.3), alignment: .center)
                            .padding(.leading, 20)
                            .padding(.trailing, (UIScreen.main.bounds.size.height)/1000 * 10)
                            .tint(colorScheme == .dark ? darkGray : lightGray)
                        }
                        
                        Button {

                        } label: {
                            VStack {
                                HStack {
                                    Text("Week")
                                        .font(.system(size: (UIScreen.main.bounds.size.height/40), weight: .heavy))
                                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                                    Spacer()
                                    Text("\(selectedWeek(chosenDate:selectedDate))")
                                        .font(.system(size: (UIScreen.main.bounds.size.height/40), weight: .heavy))
                                        .foregroundStyle(themeColor)
                                }
                            }
                            .padding((UIScreen.main.bounds.size.height)/928 + 20)
                            .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            .frame(height: (UIScreen.main.bounds.size.height/15.3), alignment: .center)
                            .padding(.trailing, 20)
                            .padding(.leading, (UIScreen.main.bounds.size.height)/1000 * 10)
                            .tint(colorScheme == .dark ? darkGray : lightGray)
                        }
                    }
                    .padding(.bottom, 15)
                    
                    HStack {
                        Button {

                        } label: {
                            VStack {
                                HStack {
                                    Text("Month")
                                        .font(.system(size: (UIScreen.main.bounds.size.height/40), weight: .heavy))
                                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                                    Spacer()
                                    Text("\(selectedMonth(chosenDate:selectedDate))")
                                        .font(.system(size: (UIScreen.main.bounds.size.height/40), weight: .heavy))
                                        .foregroundStyle(themeColor)
                                }
                            }
                            .padding((UIScreen.main.bounds.size.height)/928 + 20)
                            .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            .frame(height: (UIScreen.main.bounds.size.height/15.3), alignment: .center)
                            .padding(.leading, 20)
                            .padding(.trailing, (UIScreen.main.bounds.size.height)/1000 * 10)
                            .tint(colorScheme == .dark ? darkGray : lightGray)
                        }
                        
                        Button {

                        } label: {
                            VStack {
                                HStack {
                                    Text("Year")
                                        .font(.system(size: (UIScreen.main.bounds.size.height/40), weight: .heavy))
                                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                                    Spacer()
                                    Text("\(selectedYearLong(chosenDate:selectedDate))")
                                        .font(.system(size: (UIScreen.main.bounds.size.height/40), weight: .heavy))
                                        .foregroundStyle(themeColor)
                                }
                            }
                            .padding((UIScreen.main.bounds.size.height)/928 + 20)
                            .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            .frame(height: (UIScreen.main.bounds.size.height/15.3), alignment: .center)
                            .padding(.trailing, 20)
                            .padding(.leading, (UIScreen.main.bounds.size.height)/1000 * 10)
                            .tint(colorScheme == .dark ? darkGray : lightGray)
                        }
                    }
                }
                .padding(.bottom, 20)
                    
                Spacer()
            }
       }
    }
}

// MARK: - Preview
struct TimeMachineView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample ThemeManager for the preview
        let themeManager = ThemeManager()
        themeManager.selectedTheme = .default(.blue) // Set a default theme for the preview
        
        // Create a sample AppearanceViewModel for the preview
        let appearanceViewModel = AppearanceViewModel()
        
        return TimeMachineView()
            .environmentObject(themeManager) // Inject the sample ThemeManager
            .environmentObject(appearanceViewModel) // Inject the sample AppearanceViewModel
    }
}
extension Int {
    static func parse(from string: String) -> Int? {
        Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }
}
