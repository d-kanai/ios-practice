import Foundation

struct DoDRecord: Hashable, Codable, Identifiable {
    var id: Int
    var dodId: Int
    var date: Date
    var value: Int
    var comment: String
    
    init(id:Int, dodId: Int, date: Date, value: Int, comment: String) {
        self.id = id
        self.dodId = dodId
        self.date = date
        self.value = value
        self.comment = comment
    }
}
