//
//  GM_TestApp.swift
//  GM-Test
//
//  Created by Austin Beck on 2/20/21.
//

import SwiftUI

@main
struct GM_TestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
