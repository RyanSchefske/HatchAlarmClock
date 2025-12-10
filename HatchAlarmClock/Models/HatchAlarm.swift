//
//  HatchAlarm.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

struct HatchAlarm: Identifiable, Codable {
    var id = UUID()
    var hour: Int
    var minute: Int
    var second: Int
    var sound: AlarmSound
    var recurring: Recurring
    var allowsSnooze: Bool
    var savedFromServer: Bool
    
    init(serverAlarm: ServerAlarm) {
        self.id = UUID()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: serverAlarm.timestamp) ?? .now
        self.hour = Calendar.current.component(.hour, from: date)
        self.minute = Calendar.current.component(.minute, from: date)
        self.second = Calendar.current.component(.second, from: date)
        self.sound = serverAlarm.sound
        self.recurring = serverAlarm.recurring
        self.allowsSnooze = false
        self.savedFromServer = true
    }
}

struct ServerAlarm: Codable {
    var timestamp: String
    var sound: AlarmSound
    var recurring: Recurring
}
