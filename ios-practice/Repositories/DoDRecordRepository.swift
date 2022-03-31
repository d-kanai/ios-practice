import Foundation

class DoDRecordRepository: ObservableObject {
    enum RuntimeError: Error {
        case general
    }
    func findAll(dodId: Int) async throws -> [DoDRecord] {
        let dodRecordListResponse :DoDRecordListResponse = try await HttpClient().get(url: "/dods/\(dodId)/records")
        return dodRecordListResponse.items
    }
}

struct DoDRecordListResponse: Hashable, Codable {
    var items: [DoDRecord]
}
