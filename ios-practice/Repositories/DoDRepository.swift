import Foundation

protocol IDoDRepository: ObservableObject {
    func findAll() async throws -> [DoD]
}

class DoDRepository: IDoDRepository {
    enum RuntimeError: Error {
        case general
    }
    func findAll() async throws -> [DoD] {
        let dodListResponse :DoDListResponse = try await HttpClient().get(url: "/dods")
        return dodListResponse.items
    }
    
    func create(name: String) async throws -> DoD {
        let body: [String: Any] = ["name": name]
        let dod:DoD = try await HttpClient().post(url: "/dods", body: body)
        return dod
        
        let url =  URL(string:"http://localhost:9000/dods")!
        let finalBody = try? JSONSerialization.data(withJSONObject: body)
        print(finalBody!)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else {
            throw RuntimeError.general
        }
        print(response.statusCode)
        let decodedResponse = try JSONDecoder().decode(DoD.self, from: data)
        return decodedResponse
    }
}

struct DoDListResponse: Hashable, Codable {
    var items: [DoD]
}
