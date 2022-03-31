import SwiftUI

@main
struct ios_practiceApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var modelData = ModelData()
    
    init() {
        print("APP init...")
        if (ProcessInfo.processInfo.arguments.contains("-isTesting") ) {
            print("run in Test Mode")
            async { //IMPROVE reset data abit delaying
                let _:DoD = try await HttpClient().post(url: "/test/reset")
            }
            
        }

    }

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

