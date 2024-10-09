//
//  GrokUsage.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

struct GrokUsage: Decodable {
    enum CodingKeys: String, CodingKey {
        case queueTime = "queue_time"
        case promptTokens = "prompt_tokens"
        case promptTime = "prompt_time"
        case completionTokens = "completion_tokens"
        case completionTime = "completion_time"
        case totalTokens = "total_tokens"
    }
    
    let queueTime: TimeInterval
    let promptTokens: Int
    let promptTime: TimeInterval
    let completionTokens: Int
    let completionTime: TimeInterval
    let totalTokens: Int
}
