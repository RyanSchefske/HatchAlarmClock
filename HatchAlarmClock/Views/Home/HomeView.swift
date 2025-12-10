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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            do {
                try await viewModel.fetchAlarms()
            } catch {
                // TODO: Surface errors to user
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    HomeView()
}
