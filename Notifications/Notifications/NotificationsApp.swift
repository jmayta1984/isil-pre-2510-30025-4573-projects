//
//  NotificationsApp.swift
//  Notifications
//
//  Created by Alumno on 4/07/25.
//

import SwiftUI

@main
struct NotificationsApp: App {
    
    private let notificationManager = NotificationManager()
    
    init () {
        notificationManager.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(notificationManager)
        }
    }
}
