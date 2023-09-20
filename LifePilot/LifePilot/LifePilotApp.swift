//
//  LifePilotApp.swift
//  LifePilot
//
//  Created by Hugo Valverde on 9/20/23.
//

import SwiftUI

@main
struct LifePilotApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            
                NavigationView {
                    WelcomeScreen()
                }
           // ContentView()
           //     .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
