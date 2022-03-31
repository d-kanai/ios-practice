import SwiftUI

struct DoDForm: View {
    var onSubmit: (String) async throws -> ()
    @State var name: String = ""
    @State var showingAlert: Bool = false
    @FocusState var focus:Bool
    
    var body: some View {
        Form {
            TextField("name", text: $name).focused(self.$focus)
            Button(action: {
                Task {
                    print("tap button")
                    try await self.onSubmit(self.name)
                    self.showingAlert = true
                    self.focus = false
                }
            }) {
                Text("Create DoD")
            }.alert("Create DoD completed.", isPresented: $showingAlert) { }
        }
    }
}

//struct DoDForm_Previews: PreviewProvider {
//    func onSubmit(name: String) async throws {}
//    static var previews: some View {
//        DoDForm(onSubmit: onSubmit)
//    }
//}
