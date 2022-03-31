
import SwiftUI

struct DoDRecordRow: View {
    var dodRecord: DoDRecord
    
    var body: some View {
        Text(dodRecord.comment)
    }
}

struct DoDRecordRow_Previews: PreviewProvider {
    static var previews: some View {
        DoDRecordRow(dodRecord: DoDRecord.init(id: 1, dodId: 1, date: Date(), value: 100, comment: "feature"))
    }
}

