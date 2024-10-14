//
//  ReviewService.swift
//  GrokSwift
//
//  Created by Alin Petrus on 10.10.2024.
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

protocol ReviewService {
    func requestReview(apiKey: String,
                       withContent content: String,
                       prompt: some ReviewPrompt) async throws -> ReviewOutput
}
