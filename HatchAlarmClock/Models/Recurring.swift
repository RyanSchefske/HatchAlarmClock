//
//  Recurring.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

enum Recurring: String, Codable {
    case never
    case daily
    case weekly
    case monthly
    case yearly
    
    enum CodingKeys: String, CodingKey {
        case daily, weekly, monthly, yearly
        case never = "one-time"
    }
}
