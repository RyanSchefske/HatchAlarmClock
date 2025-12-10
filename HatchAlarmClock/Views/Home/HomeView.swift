//
//  ContentView.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        List($viewModel.alarms) { $alarm in
            AlarmCellView(alarm: $alarm)
        }
        .task {
            do {
                try await viewModel.fetchAlarms()
            } catch {
                // TODO: Surface errors to user
                print("Error: \(error)")
            }
        }
        .overlay {
            if viewModel.isLoading {
                ZStack {
                    ProgressView()
                        .tint(.blue)
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color.secondary.opacity(0.4))
                        .padding()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
