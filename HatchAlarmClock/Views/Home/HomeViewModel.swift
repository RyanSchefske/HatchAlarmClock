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
        isLoading = true
        let url = URL(string: "https://671267816c5f5ced6623613b.mockapi.io/alarms")!
        var serverAlarms: [ServerAlarm] = try await networkManager.performRequest(url: url, httpMethod: .GET)
        let newAlarms = serverAlarms.map { oldAlarm -> HatchAlarm in
            var alarm = HatchAlarm(serverAlarm: oldAlarm)
            alarm.savedFromServer = true
            return alarm
        }
        self.alarms = newAlarms
        isLoading = false
    }
}
