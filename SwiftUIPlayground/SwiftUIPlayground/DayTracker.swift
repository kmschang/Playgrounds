//
//  DayTracker.swift
//  SwiftUIPlayground
//
//  Created by Kyle Schang on 2/20/24.
//

import SwiftUI

let date = Date()

let components = Calendar.current.dateComponents([.hour, .minute], from: date)
let hour = components.hour ?? 0
let minute = components.minute ?? 0

struct DayTracker: View {
    var body: some View {
        Text(Date.now, format: .dateTime.day().month().year())
    }
}

#Preview {
    DayTracker()
}
