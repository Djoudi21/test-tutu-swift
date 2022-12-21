//
//  tutuApp.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 21/12/2022.
//

import SwiftUI

@main
struct tutuApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
