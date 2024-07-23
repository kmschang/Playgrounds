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
    private var timer: Timer?
    private let calendar = Calendar.current
    
    init() {
        self.dateInfo = DateViewModel.calculateDateInformation()
        setupTimer()
    }
    
    // Change this method to public
    func setupTimer() {
        let midnight = calendar.startOfDay(for: Date().addingTimeInterval(86400))
        let timeInterval = midnight.timeIntervalSinceNow
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { [weak self] _ in
            self?.updateDateInformation()
            self?.setupDailyTimer()
        }
    }
    
    // Add this new public method
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
    }
    
    static func calculateDateInformation() -> DateInformation {
        let date = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE"
        let weekday = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "MMMM"
        let month = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "MM/dd/yy"
        let dateString = dateFormatter.string(from: date)
        
        return DateInformation(
            dayOfYear: calendar.ordinality(of: .day, in: .year, for: date) ?? 0,
            weekday: weekday,
            weekOfYear: calendar.component(.weekOfYear, from: date),
            monthOfYear: month,
            year: calendar.component(.year, from: date),
            date: dateString
        )
    }
}
