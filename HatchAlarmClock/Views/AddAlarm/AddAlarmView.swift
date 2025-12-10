//
//  AddAlarmView.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/10/25.
//

import SwiftUI

struct AddAlarmView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var date = Date.now
    @State private var sound: AlarmSound = .ocean
    @State private var recurring: Recurring = .never
    @State private var allowsSnooze: Bool = false
    
    var addAlarm: (HatchAlarm) -> Void
    
    var body: some View {
        VStack {
            Text("Add Alarm")
                .padding(.vertical)
            
            DatePicker(selection: $date) { }
                .datePickerStyle(.wheel)
            
            HStack {
                Text("Alarm Sound")
                
                Spacer()
                
                Menu(sound.displayName) {
                    ForEach(AlarmSound.allCases, id: \.self) { sound in
                        Button(action: { self.sound = sound }) {
                            Text(sound.displayName)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            
            HStack {
                Text("Recurring")
                
                Spacer()
                
                Menu(recurring.displayString) {
                    ForEach(Recurring.allCases, id: \.self) { recurring in
                        Button(action: { self.recurring = recurring }) {
                            Text(recurring.displayString)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            
            Toggle("Snooze Enabled", isOn: $allowsSnooze)
                .padding(.horizontal)
                .padding(.vertical, 4)
            
            Button {
                let alarm = HatchAlarm(isOn: true, date: date, sound: sound, recurring: recurring, allowsSnooze: allowsSnooze, savedFromServer: false)
                addAlarm(alarm)
                dismiss()
            } label: {
                Text("Save")
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                    }
            }
            .padding(.vertical)
            
            Spacer()
        }
    }
}

#Preview {
    VStack {}
        .sheet(isPresented: .constant(true)) {
            AddAlarmView { _ in }
        }
}
