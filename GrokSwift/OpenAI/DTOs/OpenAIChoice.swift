//
//  OpenAIChoice.swift
//  GrokSwift
//
//  Created by Alin Petrus on 14.10.2024.
//

import Foundation

struct OpenAIChoice: Decodable {
    let index: Int
    let message: OpenAIMessage
    var finishReason: String?
}
