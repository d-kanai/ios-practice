//
//  ios_practiceApp.swift
//  ios-practice
//
//  Created by daiki kanai on 2022/03/05.
//

import SwiftUI

@main
struct ios_practiceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
