//
//  HatchError.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

enum HatchError: Error {
    case failedToSetAlarm
    case failedToFetchAlarm
    case failedToDeleteAlarm
    case invalidAlarmSet
}
