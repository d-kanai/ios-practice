import Foundation

class DoDRecordRepository: ObservableObject {
    enum RuntimeError: Error {
        case general
    }
    func findAll(dodId: Int) async throws -> [DoDRecord] {
        let dodRecordListResponse :DoDRecordListResponse = try await HttpClient().get(url: "/dods/\(dodId)/records")
        return dodRecordListResponse.items
    }
    func create(params: Dictionary<String, Any>) async throws -> DoDRecord {
        let dodRecord: DoDRecord = try await HttpClient().post(url: "/dodRecords", body: params)
        return dodRecord
    }
}

struct DoDRecordListResponse: Hashable, Codable {
    var items: [DoDRecord]
}
