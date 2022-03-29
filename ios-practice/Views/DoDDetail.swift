
import SwiftUI

struct DoDDetail: View {
    var dod: DoD

    var body: some View {
        Text(dod.name)
    }
}

struct DoDDetail_Previews: PreviewProvider {
    static var previews: some View {
        DoDDetail(dod: DoD.init(id: 1, name: "Long Method"))
    }
}
