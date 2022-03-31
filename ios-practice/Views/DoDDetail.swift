
import SwiftUI

struct DoDDetail: View {
    var dod: DoD
    @State private var dodRecordList = [DoDRecord]()
    @EnvironmentObject var dodRecordRepository: DoDRecordRepository
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dodRecordList) { dodRecord in
                    DoDRecordRow(dodRecord: dodRecord)
                }
            }
        }.onAppear {
            print("👍 onApper: DoD Record List")
            Task {
                do {
                    dodRecordList = try await dodRecordRepository.findAll(dodId: dod.id)
                } catch {
                    //TODO
                }
            }
            
        }
    }
}

struct DoDDetail_Previews: PreviewProvider {
    static var previews: some View {
        let dodRecordRepository:DoDRecordRepository = FakeDoDRecordRepository()
        DoDDetail(dod: DoD.init(id: 1, name: "Long Method"))
            .environmentObject(dodRecordRepository)
    }
}
