//
//  AlarmSound.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

enum AlarmSound: String, Codable {
    case party
    case brownNoise
    case ocean
    case whiteNoise
    
    var soundFile: String {
        return "\(self.rawValue).wav"
    }
    
    enum CodingKeys: String, CodingKey {
        case party, ocean
        case brownNoise = "brown-noise"
        case whiteNoise = "white-noise"
    }
}
