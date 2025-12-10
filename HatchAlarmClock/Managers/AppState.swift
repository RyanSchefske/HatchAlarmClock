//
//  AppState.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/10/25.
//

import Foundation

@Observable
final class AppState {
    static let shared = AppState()
    
    var alarmIsRinging = false
    var activeId: String? = nil
}
