//
//  CustomColors.swift
//  ListPlaygrounds
//
//  Created by Kyle Schang on 7/17/24.
//

import Foundation
import SwiftUI

struct DefaultColors: Identifiable {
    
    var colorName:String
    var color:Color
    var colorUI:UIColor
    var isSelected:Bool
    let id = UUID()
    
    static func preview() -> [DefaultColors] {
        [DefaultColors(colorName: "Red", color: .red, colorUI: .systemRed, isSelected: true),
         DefaultColors(colorName: "Orange", color: .orange, colorUI: .systemOrange, isSelected: false),
         DefaultColors(colorName: "Yellow", color: .yellow, colorUI: .systemYellow, isSelected: false)]
    }
}

struct CustomColors: Identifiable {
    
    var colorName:String
    var colorHEX:String
    var isSelected:Bool
    let id = UUID()
    
    static func preview() -> [CustomColors] {
        [CustomColors(colorName: "Red", colorHEX: "#C32026", isSelected: false),
            CustomColors(colorName: "Blue", colorHEX: "#373F52", isSelected: false),
            CustomColors(colorName: "Yellow", colorHEX: "FAA71A", isSelected: false)]
    }
    
    
}


