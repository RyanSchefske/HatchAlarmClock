//
//  HatchAlarmClockApp.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import SwiftUI

@main
struct HatchAlarmClockApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
