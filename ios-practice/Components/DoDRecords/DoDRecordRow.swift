
import SwiftUI

struct DoDRecordRow: View {
    var dodRecord: DoDRecord
    
    var body: some View {
        HStack{
            Text(dodRecord.date)
            Text(String(dodRecord.value))
            Text(dodRecord.comment)
        }
    }
}

struct DoDRecordRow_Previews: PreviewProvider {
    static var previews: some View {
        DoDRecordRow(dodRecord: DoDRecord.init(id: 1, dodId: 1, date: "2020-01-01", value: 100, comment: "feature"))
    }
}

