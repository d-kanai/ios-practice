
import SwiftUI
import CoreData

struct LandmarkApp: View {
    
    @State private var selection: Tab = .list
    
    enum Tab {
        case list
        case list2
    }
    
    var body: some View {
        TabView(selection: $selection) {
            LandmarkList()
                .tabItem {
                    Label("list", systemImage: "star")
                }.tag(Tab.list)
            Sample()
                .tabItem {
                    Label("list2", systemImage: "list.bullet")
                }.tag(Tab.list2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkApp()
            .environmentObject(ModelData())
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
