//
//  ContentView.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @State private var appState = AppState.shared
    
    var body: some View {
        NavigationStack {
            List($viewModel.alarms) { $alarm in
                AlarmCellView(alarm: $alarm) {
                    viewModel.setAlarm(alarm)
                }
            }
            .task {
                viewModel.requestNotificationPermission()
                do {
                    try await viewModel.fetchAlarms()
                } catch {
                    // TODO: Surface errors to user
                    print("Error: \(error)")
                }
            }
            .navigationTitle("Alarms")
            .toolbar {
                Button {
                    viewModel.showingAddAlarmView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .overlay {
                if viewModel.isLoading {
                    ZStack {
                        ProgressView()
                            .tint(.blue)
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color.secondary.opacity(0.4))
                    }
                    .frame(width: 30, height: 30)
                }
            }
            .sheet(isPresented: $viewModel.showingAddAlarmView) {
                AddAlarmView { alarm in
                    viewModel.alarms.append(alarm)
                    viewModel.alarms.sort()
                    viewModel.setAlarm(alarm)
                }
            }
            .sheet(isPresented: $appState.alarmIsRinging) {
                DismissAlarmView {
                    guard let id = appState.activeId else { return }
                    viewModel.stopAlarm(with: id)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
