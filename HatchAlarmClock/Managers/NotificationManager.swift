//
//  NotificationManager.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation
import UIKit
import UserNotifications

struct NotificationManager {
    func scheduleNotification(for alarm: HatchAlarm) throws {
        let content = UNMutableNotificationContent()
        content.title = "Hatch Alarm"
        content.subtitle = "Your alarm is ringing!"
        
        if let dateComponents = nextAlarmDate(for: alarm) {
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let request = UNNotificationRequest(identifier: alarm.id.uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        } else {
            throw HatchError.failedToSetAlarm
        }
    }
    
    private func nextAlarmDate(for alarm: HatchAlarm) -> DateComponents? {
        let alarmComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: alarm.date)
        let nowComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: .now)
        
        if alarm.date > Date.now {
            return alarmComponents
        } else {
            return nil
        }
    }
    
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func clearPendingNotification(with id: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [id])
    }
}
