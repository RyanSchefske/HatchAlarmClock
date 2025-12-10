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
}
