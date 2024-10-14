//
//  GrokRequestDTO.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

struct GrokRequestDTO: Encodable {
    let messages: [GrokMessage]
    let model: String = "mixtral-8x7b-32768"
}
