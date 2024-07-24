//
//  CleanPlaceholderApp.swift
//  CleanPlaceholder
//
//  Created by Liudmila Boeva on 7/24/24.
//

import SwiftUI

@main
struct CleanPlaceholderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
