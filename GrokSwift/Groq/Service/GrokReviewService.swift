//
//  GrokService.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

public enum NetworkError: Error {
    case generic
    case internalServerError
    case noDataConnection
    case badResourcePath
    case badInput
    case invalidResponse
    case cancelled
    case missingUrl
    case badUrl
    case queryCreation
    case decoding
    case encoding
    case alreadyExecuting
    case tokenExpired
}

final class GrokReviewService: ReviewService {
    private let session: URLSession = URLSession.shared
    
    func requestReview(apiKey: String,
                       withContent content: String,
                       prompt: some ReviewPrompt) async throws -> ReviewOutput {
        let request = try GrokRequest(content: prompt.asPromptText() + content,
                                      key: apiKey).asURLRequest()
        
        let response = try await self.session.data(for: request)
        
        guard let httpResponse = response.1 as? HTTPURLResponse else {
            throw NetworkError.generic
        }
        
        if let error = httpResponse.responseError {
            throw error
        }
        
        return try JSONDecoder().decode(GrokReview.self, from: response.0)
    }
    
}

extension HTTPURLResponse {
    var isSuccess: Bool { statusCode >= 200 && statusCode <= 299 }
    
    var responseError: NetworkError? {
        guard !self.isSuccess else { return nil }
        
        switch statusCode {
        case 401:
            return .tokenExpired
        case 500...599:
            return .internalServerError
        default:
            return .generic
        }
    }
}
