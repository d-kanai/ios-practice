import SwiftUI

struct DoDApp: View {
    @State private var selection: Tab = .list
    
    enum Tab {
        case list
        case create
    }
    
    var body: some View {
        TabView(selection: $selection) {
            DoDList()
                .tabItem {
                    Label("list", systemImage: "list.bullet")
                }.tag(Tab.list)
            Sample()
                .tabItem {
                    Label("create", systemImage: "list.bullet")
                }.tag(Tab.create)
        }
    }
}

struct DoDApp_Previews: PreviewProvider {
    static var previews: some View {
        DoDApp()
    }
}
