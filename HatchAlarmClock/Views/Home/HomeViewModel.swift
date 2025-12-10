//
//  HomeViewModel.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

@Observable
final class HomeViewModel {
    private let networkManager = NetworkManager()
    private let notificationManager = NotificationManager()
    
    var alarms: [HatchAlarm] = []
    var isLoading = false
    var showingAddAlarmView = false
    
    func fetchAlarms() async throws {
        isLoading = true
        let url = URL(string: "https://671267816c5f5ced6623613b.mockapi.io/alarms")!
        let serverAlarms: [ServerAlarm] = try await networkManager.performRequest(url: url, httpMethod: .GET)
        let newAlarms = serverAlarms.map { oldAlarm -> HatchAlarm in
            var alarm = HatchAlarm(serverAlarm: oldAlarm)
            alarm.savedFromServer = true
            return alarm
        }
        var uniqueAlarms: [HatchAlarm] = []
        for alarm in newAlarms {
            if uniqueAlarms.contains(where: { $0 == alarm }) {
                break
            } else {
                uniqueAlarms.append(alarm)
            }
        }
        self.alarms = uniqueAlarms.sorted(by: <)
        isLoading = false
    }
    
    func setAlarm(_ alarm: HatchAlarm) {
        if alarm.isOn {
            do {
                try notificationManager.scheduleNotification(for: alarm)
            } catch {
                // TODO: Surface error to user
                print("Error: \(error)")
            }
        } else {
            notificationManager.clearPendingNotification(with: alarm.id.uuidString)
        }
    }
    
    func stopAlarm(with id: String) {
        guard let alarmIndex = alarms.firstIndex(where: { $0.id.uuidString == id }) else { return }
        if alarms[alarmIndex].recurring == .never {
            alarms[alarmIndex].isOn = false
        }
        notificationManager.clearPendingNotification(with: id)
    }
    
    func requestNotificationPermission() {
        notificationManager.requestNotificationAuthorization()
    }
}

