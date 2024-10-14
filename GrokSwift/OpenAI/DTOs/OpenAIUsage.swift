//
//  OpenAIUsage.swift
//  GrokSwift
//
//  Created by Alin Petrus on 14.10.2024.
//

import Foundation

struct OpenAIUsage: Decodable {
    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
    
    let promptTokens: Int
    let completionTokens: Int
    let totalTokens: Int
}
