//
//  ReviewPromptType.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

enum ReviewPromptType: String, ReviewPrompt {
    case swift = "swift"
    
    func asPromptText() -> String {
        switch self {
        case .swift:
            return swiftReviewPrompt()
        }
    }
    
}
