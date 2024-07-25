//
//  DaysScrollView.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/25/24.
//

import SwiftUI

struct DaysScrollView: View {
    @ObservedObject var dateViewModel: DateViewModel
    @State private var selectedDate: Date = Date()

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<1000, id: \.self) { index in
                        let date = Calendar.current.date(byAdding: .day, value: index - 500, to: Date())!
                        let dayOfWeek = dateViewModel.getDayOfWeek(for: date)
                        let dayOfMonth = Calendar.current.component(.day, from: date)
                        let isToday = Calendar.current.isDateInToday(date)
                        let isSelected = Calendar.current.isDate(date, inSameDayAs: selectedDate)

                        DayView(dayOfWeek: dayOfWeek, dayOfMonth: dayOfMonth, isToday: isToday, isSelected: isSelected)
                            .onTapGesture {
                                selectedDate = date
                                dateViewModel.currentDate = DateViewModel.calculateDateInformation(for: date)
                            }
                            .id(isToday ? "today" : "\(date)")
                    }
                }
                .padding()
            }
            .onAppear {
                scrollToToday(proxy: proxy)
            }
            .onChange(of: selectedDate) { oldDate, newDate in
                scrollTo(newDate, proxy: proxy)
            }
        }
    }

    private func scrollToToday(proxy: ScrollViewProxy) {
        withAnimation {
            proxy.scrollTo("today", anchor: .leading)
        }
    }

    private func scrollTo(_ date: Date, proxy: ScrollViewProxy) {
        withAnimation {
            proxy.scrollTo(Calendar.current.isDateInToday(date) ? "today" : "\(date)", anchor: .center)
        }
    }
}




#Preview {
    DaysScrollView(dateViewModel: DateViewModel())
}
