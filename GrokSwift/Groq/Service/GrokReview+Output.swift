//
//  GrokReview+Output.swift
//  GrokSwift
//
//  Created by Alin Petrus on 10.10.2024.
//

import Foundation

extension GrokReview: ReviewOutput {
    func asText() -> String {
        var text = ""
        
        self.choices.forEach { choice in
            text.append("\n")
            text.append("========================================")
            text.append(choice.message.content)
            text.append("\n")
        }
        
        return text
    }
}
