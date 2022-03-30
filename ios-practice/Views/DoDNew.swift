import SwiftUI

struct DoDNew: View {
    @EnvironmentObject var dodRepository: DoDRepository
    
    var body: some View {
        NavigationView {
            DoDForm(onSubmit: onSubmit)
                .navigationBarTitle("DoD New")
        }
    }
    
    func onSubmit(name: String) async throws {
        let _ = try await dodRepository.create(name: name)
    }
}

struct DoDNew_Previews: PreviewProvider {
    static var previews: some View {
        let dodRepository: DoDRepository = FakeDoDRepository()
        DoDNew().environmentObject(dodRepository)
    }
}
