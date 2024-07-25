import Foundation

protocol APIScheme {
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    func body() throws -> Data?
}

extension APIScheme {
    func urlRequest(targetURL: Endpoints) throws -> URLRequest {
        guard let url = URL(string: targetURL.url) else {
            throw NetworkError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.httpBody = try body()
        return request
    }
}
