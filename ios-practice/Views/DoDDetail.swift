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
                }) {
                    Image(systemName: "plus")
                }.sheet(isPresented: $isShowModal) {
                    DoDRecordNewModalView(onSubmit: onSubmit)
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
    
    func onSubmit(formData: Dictionary<String, String>) async throws {
        //        let _ = try await dodRecordRepository.create(name: name)
    }
}

struct DoDDetail_Previews: PreviewProvider {
    static var previews: some View {
        let dodRecordRepository:DoDRecordRepository = FakeDoDRecordRepository()
        DoDDetail(dod: DoD.init(id: 1, name: "Long Method"))
            .environmentObject(dodRecordRepository)
    }
}
