//
//  ServerAlarm.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

struct ServerAlarm: Codable {
    var timestamp: String
    var sound: AlarmSound
    var recurring: Recurring
}
