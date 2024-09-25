//
//  ahamoveApp.swift
//  ahamove
//
//  Created by Nghia on 19/09/2024.
//

import SwiftUI

@main
struct ahamoveApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
