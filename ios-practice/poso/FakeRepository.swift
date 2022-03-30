import Foundation

class FakeDoDRepository: DoDRepository {
    override func findAll() async throws -> [DoD] {
        return [DoD.init(id: 1, name: "Fake Long Method")]
    }
    
}
