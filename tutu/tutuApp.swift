//
//  tutuApp.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 21/12/2022.
//

import SwiftUI

@main
struct tutuApp: App {
  @StateObject private var coreDataViewModel = CoreDataViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataViewModel.container.viewContext)
        }
    }
}
