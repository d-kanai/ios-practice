import Foundation

class DoDRecordRepository: ObservableObject {
    enum RuntimeError: Error {
        case general
    }
    func findAll(dodId: Int) async throws -> [DoDRecord] {
        let dodRecordListResponse :DoDRecordListResponse = try await HttpClient().get(url: "/dods/\(dodId)/records")
        return dodRecordListResponse.items
    }
    func create(value: String) async throws -> DoDRecord {
        let body: [String: Any] = ["value": value]
        let dodRecord: DoDRecord = try await HttpClient().post(url: "/dodRecords", body: body)
        return dodRecord
    }
}

struct DoDRecordListResponse: Hashable, Codable {
    var items: [DoDRecord]
}
