//
//  ContentView.swift
//  Notifications
//
//  Created by Alumno on 4/07/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notificationManager: NotificationManager
    
    var body: some View {
        VStack {
            Button {
                notificationManager.requestPermission()
            } label: {
                Text("Request permission")
            }
            
            Button {
                notificationManager.scheduleNotification()
            } label: {
                Text("Schedule notification")
            }
            
            Button {
                notificationManager.calendarNotification()
            } label: {
                Text("Calendar notification")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
