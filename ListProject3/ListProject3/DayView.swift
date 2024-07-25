//
//  DayView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/25/24.
//

import SwiftUI

struct DayView: View {
    let dayOfWeek: String
    let dayOfMonth: Int
    let isToday: Bool
    let isSelected: Bool

    var body: some View {
        VStack {
            Text(dayOfWeek.prefix(3))
                .font(.caption)
                .foregroundColor(isToday || isSelected ? .accentColor : .primary)
            Text("\(dayOfMonth)")
                .font(.title)
                .foregroundColor(isToday || isSelected ? .accentColor : .primary)
                .bold(isToday || isSelected)
        }
        .frame(width: 50, height: 70)
        .background(isToday || isSelected ? Color.accentColor.opacity(0.1) : Color.clear)
        .cornerRadius(10)
    }
}

extension View {
    func bold(_ isBold: Bool) -> some View {
        isBold ? self.fontWeight(.bold) as! Self : self
    }
}


#Preview {
    DayView(dayOfWeek: "Monday", dayOfMonth: 25, isToday: false, isSelected: false)
}
