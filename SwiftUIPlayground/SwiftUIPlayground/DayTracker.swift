//
//  DayTracker.swift
//  SwiftUIPlayground
//
//  Created by Kyle Schang on 2/20/24.
//

import SwiftUI

var difference = (Date() - Date().firstDayOfYear()!) / 86400

struct DayTracker: View {
    
    @State var badgeManager = AppAlertBadgeManager(application: UIApplication.shared)
    
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                        .fill(Color.red)
                        .stroke(
                            Color.black,
                            style: StrokeStyle(
                                lineWidth: 5,
                                lineCap: .round
                            )
                        )
                            .frame(width: 300, height: 100, alignment: .center)
                            .overlay(
                                Text("Day")
                                    .foregroundStyle(Color(uiColor: .white))
                                    .font(.system(size: 80, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, alignment: .top))
                    
                    RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                        .stroke(
                            Color.black,
                            style: StrokeStyle(
                                lineWidth: 5,
                                lineCap: .round
                            )
                        )
                            .frame(width: 300, height: 300, alignment: .center)
                            .overlay(
                                Text("\(Int(difference.rounded(.up)))")
                                    .foregroundStyle(Color(uiColor: .black))
                                    .font(.system(size: 135, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 90)
                                    .frame(maxWidth: .infinity, alignment: .top))
                            .padding(.top, 200)
                }
                Spacer()
            }
                   
                        
        }
        .onAppear {
            badgeManager.setAlertBadge(number: 1)
        }
    }
}

#Preview {
    DayTracker()
}

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
    func year(using calendar: Calendar = .current) -> Int {
        calendar.component(.year, from: self)
    }
    func firstDayOfYear(using calendar: Calendar = .current) -> Date? {
        DateComponents(calendar: calendar, year: year(using: calendar)).date
    }

}
