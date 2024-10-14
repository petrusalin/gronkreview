//
//  OpenAIRequest.swift
//  GrokSwift
//
//  Created by Alin Petrus on 14.10.2024.
//

import Foundation

final class OpenAIRequest: Request {
    private let endpoint: String = "https://api.openai.com/v1/chat/completions"
    private let projectId: String
    private let apiKey: String
    
    private let dto: OpenAIRequestDTO
    
    private var headers: [String: String] {
        [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.apiKey)"
        ]
    }
    
    init(content: String, 
         key: String,
         projectId: String = "proj_5yevFC1CG5hxI81vbC03avkV") {
        self.apiKey = key
        self.projectId = projectId
        self.dto = OpenAIRequestDTO(messages: [OpenAIMessage(content: content)])
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
