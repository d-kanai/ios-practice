
import SwiftUI

struct DoDRow: View {
    var dod: DoD
    
    var body: some View {
        Text(dod.name)
    }
}

struct DoDRow_Previews: PreviewProvider {
    static var previews: some View {
        DoDRow(dod: DoD.init(id: 1, name: "Long Method"))
    }
}
