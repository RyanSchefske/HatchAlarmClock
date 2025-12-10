//
//  HomeViewModel.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

@Observable
class HomeViewModel {
    private let networkManager = NetworkManager()
    
    var alarms: [HatchAlarm] = []
    var isLoading = false
    
    func fetchAlarms() async throws {
        let url = URL(string: "https://671267816c5f5ced6623613b.mockapi.io/alarms")!
        let alarms: [ServerAlarm] = try await networkManager.performRequest(url: url, httpMethod: .GET)
        self.alarms = alarms.map { HatchAlarm(serverAlarm: $0) }
    }
}
