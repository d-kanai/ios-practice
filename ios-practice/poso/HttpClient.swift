import Foundation

class HttpClient {
    
    enum RuntimeError: Error {
        case general
    }
    
    func get<T:Decodable>(url: String) async throws -> T {
        return try await request(method: "GET", url: url)
    }
    
    func post<T:Decodable>(url: String, body:[String: Any]?=nil) async throws -> T {
        return try await request(method: "POST", url: url, body: body)
    }
    
    private func request<T:Decodable>(method: String, url: String, body:[String: Any]?=nil) async throws -> T {
        let url = URL(string:"http://localhost:9000\(url)")!
        var request = URLRequest(url: url)
        request.url = url
        request.httpMethod = method
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        if(body != nil) {
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = finalBody
            print(finalBody!)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else {
            throw RuntimeError.general
        }
        print(response.statusCode)
        print(data)
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        print(decodedResponse)
        return decodedResponse
        
    }
    
}
