//
//  AppDelegate.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/10/25.
//

import AVFoundation
import Foundation
import UserNotifications
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
            try AVAudioSession.sharedInstance().setPrefersNoInterruptionsFromSystemAlerts(true)
        } catch {}
        
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.content.title == "Hatch Alarm" {
            AppState.shared.alarmIsRinging = true
            AppState.shared.activeId = response.notification.request.identifier
        }
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.content.title == "Hatch Alarm" {
            AppState.shared.alarmIsRinging = true
            AppState.shared.activeId = notification.request.identifier
        }
    }
}
