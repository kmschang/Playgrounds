//
//  CurrentWeekView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/25/24.
//

import SwiftUI

struct CurrentWeekView: View {
    @ObservedObject var dateViewModel: DateViewModel
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        let today = Date()
        let calendar = Calendar.current
        let weekRange = calendar.range(of: .day, in: .weekOfYear, for: today)!
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!
        
        RoundedRectangle(cornerRadius: 25)
            .fill(colorScheme == .dark ? .gray : .white)
            .frame(height: 150)
            .overlay {
                VStack {
                    Text("\(dateViewModel.dateInfo.monthOfYear)")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(themeManager.selectedTheme.color)
                    
                    HStack(spacing: 10) {
                        ForEach(weekRange, id: \.self) { dayOffset in
                            let date = calendar.date(byAdding: .day, value: dayOffset - 1, to: startOfWeek)!
                            let dayOfMonth = calendar.component(.day, from: date)
                            let isToday = calendar.isDateInToday(date)
                            let dayName = calendar.shortWeekdaySymbols[calendar.component(.weekday, from: date) - 1]
                            
                            VStack {
                                Text(dayName)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.75)
                                    .foregroundColor(isToday ? .black : themeManager.selectedTheme.color)
                                
                                Text("\(dayOfMonth)")
                                    .fontWeight(.semibold)
                                    .foregroundColor(isToday ? .black : themeManager.selectedTheme.color)
                            }
                            .frame(width: 40)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            .onAppear {
                dateViewModel.setupTimer()
            }
    }
}

struct CurrentWeekView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeekView(dateViewModel: DateViewModel())
            .environmentObject(ThemeManager())
    }
}
