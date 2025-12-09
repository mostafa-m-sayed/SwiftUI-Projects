//
//  SwiftUI_ProjectsApp.swift
//  SwiftUI_Projects
//
//  Created by Mostafa Sayed on 09/12/2025.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_ProjectsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
