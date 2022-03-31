import Foundation

class FakeDoDRepository: DoDRepository {
    override func findAll() async throws -> [DoD] {
        return [DoD.init(id: 1, name: "Fake Long Method")]
    }
    
}

class FakeDoDRecordRepository: DoDRecordRepository {
    override func findAll(dodId: Int) async throws -> [DoDRecord] {
        return [DoDRecord.init(id: 1, dodId: 1, date: Date(), value: 100, comment: "feature")]
    }
    
}
