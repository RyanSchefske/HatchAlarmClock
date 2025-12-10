//
//  AlarmCellView.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import SwiftUI

struct AlarmCellView: View {
    @Binding var alarm: HatchAlarm
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(alarm.date.toTimeString())
                    .font(.largeTitle)
                
                HStack {
                    if alarm.recurring == .never {
                        Text(alarm.date.toDateString())
                    }
                    
                    if alarm.savedFromServer {
                        Text("•")
                        Label {
                            Text("Saved")
                        } icon: {
                            Image(systemName: "checkmark.icloud")
                        }
                    }
                }
                .foregroundStyle(Color.secondary)
                .font(.caption)
            }
            
            Spacer()
            
            Toggle(isOn: $alarm.isOn) { }
        }
        .padding()
    }
}

#Preview {
    AlarmCellView(alarm: .constant(.mock))
}
