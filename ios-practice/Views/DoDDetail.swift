import SwiftUI

struct DoDDetail: View {
    var dod: DoD
    @State private var dodRecordList = [DoDRecord]()
    @State private var isShowModal = false
    @EnvironmentObject var dodRecordRepository: DoDRecordRepository
    
    var body: some View {
        Text(String(dod.id))
        Text(dod.name)
        NavigationView {
            List {
                ForEach(dodRecordList) { dodRecord in
                    DoDRecordRow(dodRecord: dodRecord)
                }
            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    self.isShowModal.toggle()
                }
                ) {
                    Image(systemName: "plus")
                }.sheet(isPresented: $isShowModal) {
                    DoDRecordNewModalView(onSubmit: onSubmit)
                }.accessibility(identifier: "openDoDRecordFormModal")
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
    
    func onSubmit(formData: Dictionary<String, Any>) async throws {
        let params = formData.merging(["dodId": dod.id]) { $1 }
        let dodRecord:DoDRecord = try await dodRecordRepository.create(params: params)
        self.dodRecordList.append(dodRecord)
    }
}

struct DoDDetail_Previews: PreviewProvider {
    static var previews: some View {
        let dodRecordRepository:DoDRecordRepository = FakeDoDRecordRepository()
        DoDDetail(dod: DoD.init(id: 1, name: "Long Method"))
            .environmentObject(dodRecordRepository)
    }
}
