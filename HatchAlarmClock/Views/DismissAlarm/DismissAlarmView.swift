//
//  DismissAlarmView.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/10/25.
//

import AVFoundation
import SwiftUI

struct DismissAlarmView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var appState = AppState.shared
    @State private var audioPlayer: AVAudioPlayer? = nil
    
    var alarmDismissed: () -> Void
    
    var body: some View {
        VStack {
            Text("Your alarm is ringing")
                .padding(.vertical)
            
            Text(Date.now.toTimeString())
                .font(.largeTitle)
            
            Button {
                stopSound()
                alarmDismissed()
                dismiss()
            } label: {
                Text("Dismiss")
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)//
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color.blue)
                    }
            }
            .padding(.top)
        }
        .task {
            playSound()
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "gentle.wav", withExtension: nil) else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

#Preview {
    DismissAlarmView { }
}
