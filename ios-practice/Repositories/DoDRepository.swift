import Foundation

class DoDRepository {
    func findAll() async throws -> [DoD] {
        let dodListResponse :DoDListResponse = try await HttpClient().get(url: "/dods")
        return dodListResponse.items
    }
}

struct DoDListResponse: Hashable, Codable {
    var items: [DoD]
}
