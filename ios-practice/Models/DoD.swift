import Foundation
import CoreLocation
import SwiftUI

struct DoD: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    
    init(id:Int, name:String) {
        self.id = id
        self.name = name
    }
}
