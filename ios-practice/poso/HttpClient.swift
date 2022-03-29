import Foundation

class HttpClient {
    
    enum RuntimeError: Error {
        case general
    }
    
    
    func get<T:Decodable>(url: String) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: URL(string:"http://localhost:9000\(url)")!)
        guard let response = response as? HTTPURLResponse else {
            throw RuntimeError.general
        }
        print(response.statusCode)
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        print(decodedResponse)
        return decodedResponse
    }
    
}
