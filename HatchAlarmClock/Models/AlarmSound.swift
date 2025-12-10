//
//  AlarmSound.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

enum AlarmSound: String, Codable, CaseIterable {
    case party
    case brownNoise = "brown-noise"
    case ocean
    case whiteNoise = "white-noise"
    
    var soundFile: String {
        switch self {
        case .party: return "party.wav"
        case .brownNoise: return "brownNoise.wav"
        case .ocean: return "ocean.wav"
        case .whiteNoise: return "whiteNoise.wav"
        }
    }
    
    var displayName: String {
        switch self {
        case .party: return "Party"
        case .brownNoise: return "Brown Noise"
        case .ocean: return "Ocean"
        case .whiteNoise: return "White Noise"
        }
    }
}
