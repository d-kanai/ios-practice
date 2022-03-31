import Foundation

class DoDRepository: ObservableObject {
    enum RuntimeError: Error {
        case general
    }
    
    func findAll() async throws -> [DoD] {
        let dodListResponse :DoDListResponse = try await HttpClient().get(url: "/dods")
        return dodListResponse.items
    }
    
    func create(name: String) async throws -> DoD {
        let body: [String: Any] = ["name": name]
        let dod: DoD = try await HttpClient().post(url: "/dods", body: body)
        return dod
    }
}

struct DoDListResponse: Hashable, Codable {
    var items: [DoD]
}
