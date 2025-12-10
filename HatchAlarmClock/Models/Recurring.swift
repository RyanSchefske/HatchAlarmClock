//
//  Recurring.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

enum Recurring: String, Codable, CaseIterable {
    case never = "one-time"
    case daily
    case weekly
    case monthly
    case yearly
    
    var displayString: String {
        switch self {
        case .never: return "Never"
        case .daily: return "Daily"
        case .weekly: return "Weekly"
        case .monthly: return "Monthly"
        case .yearly: return "Yearly"
        }
    }
}
