//
//  GrokMessage.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

struct GrokMessage: Codable {
    let role: String
    let content: String
    
    init(role: String = "user", content: String) {
        self.role = role
        self.content = content
    }
}
