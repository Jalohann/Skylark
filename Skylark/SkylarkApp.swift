//
//  SkylarkApp.swift
//  Skylark
//
//  Created by Johann Rajadurai on 6/12/24.
//

import SwiftUI

@main
struct SkylarkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
