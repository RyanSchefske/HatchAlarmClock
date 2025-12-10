//
//  AlarmCellView.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import SwiftUI

struct AlarmCellView: View {
    @Binding var alarm: HatchAlarm
    var didToggleAlarm: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(alarm.date.toTimeString())
                    .font(.largeTitle)
                
                HStack {
                    if alarm.recurring == .never {
                        Text(alarm.date.toDateString())
                    } else {
                        Text(alarm.recurring.displayString)
                    }
                    
                    if alarm.savedFromServer {
                        Text("•")
                        HStack {
                            Text("Saved")
                            Image(systemName: "checkmark.icloud")
                        }
                    }
                }
                .foregroundStyle(Color.secondary)
                .font(.caption)
            }
            
            Spacer()
            
            Toggle(isOn: $alarm.isOn) { }
                .onChange(of: alarm.isOn) { didToggleAlarm() }
        }
        .padding()
    }
}

#Preview {
    AlarmCellView(alarm: .constant(.mock)) {}
}
