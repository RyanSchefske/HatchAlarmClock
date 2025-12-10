//
//  HatchAlarm.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

struct HatchAlarm: Identifiable, Codable {
    var id = UUID()
    var isOn: Bool
    var date: Date
    var sound: AlarmSound
    var recurring: Recurring
    var allowsSnooze: Bool
    var savedFromServer: Bool
    
    init(isOn: Bool, date: Date, sound: AlarmSound, recurring: Recurring, allowsSnooze: Bool, savedFromServer: Bool) {
        self.id = UUID()
        self.isOn = isOn
        self.date = date
        self.sound = sound
        self.recurring = recurring
        self.allowsSnooze = allowsSnooze
        self.savedFromServer = savedFromServer
    }
    
    init(serverAlarm: ServerAlarm) {
        self.id = UUID()
        self.isOn = false
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: serverAlarm.timestamp) ?? .now
        self.date = date
        self.sound = serverAlarm.sound
        self.recurring = serverAlarm.recurring
        self.allowsSnooze = false
        self.savedFromServer = true
    }
}

extension HatchAlarm {
    static var mock = HatchAlarm(isOn: false, date: .now, sound: .ocean, recurring: .never, allowsSnooze: false, savedFromServer: true)
}
