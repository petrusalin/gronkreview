//
//  GrokService.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

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
