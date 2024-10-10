//
//  GrokMessage.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

struct GrokMessage: Encodable {
    let messages: [GrokContent]
    let model: String = "mixtral-8x7b-32768"
    
    
}
