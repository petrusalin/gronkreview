//
//  OpenAIReview.swift
//  GrokSwift
//
//  Created by Alin Petrus on 14.10.2024.
//

import Foundation

struct OpenAIReview: Decodable {
    let id: String
    let object: String
    let model: String
    let created: Int
    let choices: [OpenAIChoice]
    let usage: OpenAIUsage
}
