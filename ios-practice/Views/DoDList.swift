import SwiftUI
import Foundation

struct DoDList: View {
    @State private var dodList = [DoD]()
    @EnvironmentObject var dodRepository: DoDRepository
    
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
                    dodList = try await dodRepository.findAll()
                } catch {
                    //TODO
                }
            }
            
        }
        
    }
}

struct DoDList_Previews: PreviewProvider {
    static var previews: some View {
        let dodRepository:DoDRepository = FakeDoDRepository()
        DoDList()
            .environmentObject(dodRepository)
    }
}


