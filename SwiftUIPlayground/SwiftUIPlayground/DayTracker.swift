//
//  DayTracker.swift
//  SwiftUIPlayground
//
//  Created by Kyle Schang on 2/20/24.
//

import SwiftUI

var difference = (Date() - Date().firstDayOfYear()!) / 86400

struct DayTracker: View {
    var body: some View {
        VStack {
            
            Group {
                Text("Day\n")
                    .foregroundStyle(Color(uiColor: .red))
                    .font(.system(size: 100, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom, -150)
                Text("\(Int(difference.rounded(.up)))")
                    .foregroundStyle(Color(uiColor: .lightGray))
                    .font(.system(size: 100, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .top)
            }
        }
        .background(RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
            .stroke(
                Color.red,
                style: StrokeStyle(
                    lineWidth: 20,
                    lineCap: .round
                )
            )
                .fill(Color.white)
                .frame(width: 300, height: 300, alignment: .center)
        )
    }
}

#Preview {
    DayTracker()
}

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}

extension Date {
    func year(using calendar: Calendar = .current) -> Int {
        calendar.component(.year, from: self)
    }
    func firstDayOfYear(using calendar: Calendar = .current) -> Date? {
        DateComponents(calendar: calendar, year: year(using: calendar)).date
    }
}
