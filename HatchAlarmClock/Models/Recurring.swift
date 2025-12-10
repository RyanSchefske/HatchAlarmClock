//
//  Recurring.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

enum Recurring: String, Codable {
    case never = "one-time"
    case daily
    case weekly
    case monthly
    case yearly
}
