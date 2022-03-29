
import Foundation


class DoDRepository {
    
    func findAll() async -> [DoD] {
        return [DoD.init(id: 1, name: "Long Method")]
    }
}
