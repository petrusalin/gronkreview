//
//  ReviewService.swift
//  GrokSwift
//
//  Created by Alin Petrus on 10.10.2024.
//

import Foundation

protocol ReviewService {
    func requestReview(apiKey: String,
                       withContent content: String,
                       prompt: some ReviewPrompt) async throws -> ReviewOutput
}
