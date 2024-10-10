//
//  GrokRequest.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

final class GrokRequest: Request {
    enum RequestError: Error {
        case invalidURL
        case encoding
    }
    
    private let endpoint: String = "https://api.groq.com/openai/v1/chat/completions"
    
    private let apiKey: String
    private let dto: GrokMessage
    
    private var headers: [String: String] {
        [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.apiKey)"
        ]
    }
    
    init(content: String, key: String) {
        self.apiKey = key
        self.dto = GrokMessage(messages: [GrokContent(content: content)])
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: self.endpoint) else {
            throw RequestError.invalidURL
        }
        
        do {
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = self.headers
            request.httpBody = try JSONEncoder().encode(self.dto)
            
            return request
        } catch {
            throw RequestError.encoding
        }
    }
    
}
