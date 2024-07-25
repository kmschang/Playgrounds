//
//  DateViewModel.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/23/24.
//

import Foundation
import Combine

class DateViewModel: ObservableObject {
    @Published var dateInfo: DateInformation
    @Published var currentDate: DateInformation
    private var timer: Timer?
    private let calendar = Calendar.current
    
    init() {
        // Initialize dateInfo directly
        let initialDateInfo = DateViewModel.calculateDateInformation()
        self.dateInfo = initialDateInfo
        self.currentDate = initialDateInfo
        // Set up timer after properties are initialized
        setupTimer()
    }
    
    func setupTimer() {
        let midnight = calendar.startOfDay(for: Date().addingTimeInterval(86400))
        let timeInterval = midnight.timeIntervalSinceNow
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { [weak self] _ in
            self?.updateDateInformation()
            self?.setupDailyTimer()
        }
    }
    
    func appBecameActive() {
        updateDateInformation()
        setupTimer()
    }
    
    private func setupDailyTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 86400, repeats: true) { [weak self] _ in
            self?.updateDateInformation()
        }
    }
    
    private func updateDateInformation() {
        dateInfo = DateViewModel.calculateDateInformation()
        currentDate = dateInfo
    }
    
    static func calculateDateInformation() -> DateInformation {
        return calculateDateInformation(for: Date())
    }
    
    static func calculateDateInformation(for date: Date) -> DateInformation {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE"
        let weekday = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "MMMM"
        let month = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "MM/dd/yy"
        let dateString = dateFormatter.string(from: date)
        
        let dayOfMonth = calendar.component(.day, from: date)
        let monthOfYearNumber = calendar.component(.month, from: date)
        let dayOfWeek = calendar.component(.weekday, from: date)
        
        return DateInformation(
            dayOfYear: calendar.ordinality(of: .day, in: .year, for: date) ?? 0,
            weekday: weekday,
            weekOfYear: calendar.component(.weekOfYear, from: date),
            monthOfYear: month,
            year: calendar.component(.year, from: date),
            date: dateString,
            dayOfMonth: dayOfMonth,
            monthOfYearNumber: monthOfYearNumber,
            dayOfWeek: dayOfWeek
        )
    }
    
    func getDayOfWeek(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date)
    }
}
