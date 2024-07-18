import SwiftUI

struct Setting: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
    var description: String
}

enum SettingSection: String, CaseIterable {
    case general = "General"
    case account = "Account"
    case notifications = "Notifications"
    
    var settings: [Setting] {
        switch self {
        case .general:
            return [
                Setting(icon: "gear", title: "General Setting 1", description: "Description for general setting 1"),
                Setting(icon: "gear", title: "General Setting 2", description: "Description for general setting 2"),
                Setting(icon: "gear", title: "General Setting 2", description: "Description for general setting 2"),
                Setting(icon: "gear", title: "General Setting 2", description: "Description for general setting 2"),
                Setting(icon: "gear", title: "General Setting 2", description: "Description for general setting 2"),
                Setting(icon: "gear", title: "General Setting 2", description: "Description for general setting 2")
            ]
        case .account:
            return [
                Setting(icon: "person", title: "Account Setting 1", description: "Description for account setting 1"),
                Setting(icon: "person", title: "Account Setting 2", description: "Description for account setting 2"),
                Setting(icon: "person", title: "Account Setting 2", description: "Description for account setting 2"),
                Setting(icon: "person", title: "Account Setting 2", description: "Description for account setting 2"),
                Setting(icon: "person", title: "Account Setting 2", description: "Description for account setting 2"),
                Setting(icon: "person", title: "Account Setting 2", description: "Description for account setting 2"),
                Setting(icon: "person", title: "Account Setting 2", description: "Description for account setting 2"),
                Setting(icon: "person", title: "Account Setting 2", description: "Description for account setting 2")
            ]
        case .notifications:
            return [
                Setting(icon: "bell", title: "Notification Setting 1", description: "Description for notification setting 1"),
                Setting(icon: "bell", title: "Notification Setting 2", description: "Description for notification setting 2"),
                Setting(icon: "bell", title: "Notification Setting 2", description: "Description for notification setting 2"),
                Setting(icon: "bell", title: "Notification Setting 2", description: "Description for notification setting 2"),
                Setting(icon: "bell", title: "Notification Setting 2", description: "Description for notification setting 2"),
                Setting(icon: "bell", title: "Notification Setting 2", description: "Description for notification setting 2"),
                Setting(icon: "bell", title: "Notification Setting 2", description: "Description for notification setting 2"),
                Setting(icon: "bell", title: "Notification Setting 2", description: "Description for notification setting 2"),
                Setting(icon: "bell", title: "Notification Setting 2", description: "Description for notification setting 2")
            ]
        }
    }
}
