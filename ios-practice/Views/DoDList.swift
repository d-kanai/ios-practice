import SwiftUI
import Foundation

struct DoDList: View {
    @State private var dodList = [DoD.init(id: 1, name: "Long Method")]

    var body: some View {
        NavigationView {
            List {
                ForEach(dodList) { dod in
                    NavigationLink {
                        DoDDetail(dod: dod)
                    } label: {
                        DoDRow(dod: dod)
                    }
                }
            }.navigationTitle("DoD List")
        }
    }
}

struct DoDList_Previews: PreviewProvider {
    static var previews: some View {
        DoDList()
    }
}
