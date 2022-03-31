import SwiftUI

@main
struct ios_practiceApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            DoDApp()
                .environmentObject(modelData)
                .environmentObject(DoDRepository())
                .environmentObject(DoDRecordRepository())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

