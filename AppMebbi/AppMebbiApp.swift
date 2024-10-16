//
//  AppMebbiApp.swift
//  AppMebbi
//
//  Created by JOSE JOAQUIN JULCAMORO BUSTAMANTE on 16/10/24.
//

import SwiftUI

@main
struct AppMebbiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
