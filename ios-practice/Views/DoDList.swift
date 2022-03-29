import SwiftUI
import Foundation

struct DoDList: View {
    @State private var dodList = [DoD]()
    @EnvironmentObject var dodRepoisitory: DoDRepository

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
        }.onAppear {
            print("👍 onApper: DoD List")
            Task {
                do {
                    dodList = try await dodRepoisitory.findAll()
                } catch {
                    //TODO
                }
            }
            
        }
        
    }
}

struct DoDList_Previews: PreviewProvider {
    static var previews: some View {
        let dodRepository = FakeDoDRepository()
        DoDList()
            .environmentObject(dodRepository)
    }
}


