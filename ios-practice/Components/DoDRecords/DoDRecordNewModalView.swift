import Foundation
import SwiftUI

struct DoDRecordNewModalView: View {
    var onSubmit: (Dictionary<String, String>) async throws -> ()
    @State var value: String = ""
    @State var comment: String = ""
    @State var isShowAlert: Bool = false
    @FocusState var focus:Bool
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        Form {
            TextField("value", text: $value).focused(self.$focus)
            TextField("comment", text: $comment).focused(self.$focus)
            Button(action: {
                Task {
                    print("tap button")
                    let formData: Dictionary<String, String> = [
                        "date": "2020-01-01",
                        "value": self.value,
                        "comment": self.comment
                    ]
                    try await self.onSubmit(formData)
                    self.isShowAlert = true
                    self.focus = false
                }
            }) {
                Text("Create DoDRecord")
            }.alert(isPresented: $isShowAlert) {
                Alert(title: Text("Create DoDRecord completed."),
                      dismissButton: .default(Text("OK"),
                                              action: {dismiss()}))
            }
        }
    }
}
