//
//  OpenAIRequestDTO.swift
//  GrokSwift
//
//  Created by Alin Petrus on 14.10.2024.
//

import Foundation

struct OpenAIRequestDTO: Encodable {
    let messages: [OpenAIMessage]
    let model: String = "gpt-4o-mini"
}
