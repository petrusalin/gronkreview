//
//  ReviewPromptType.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

enum ReviewPromptType: String, CaseIterable, ReviewPrompt {
    case swift = "swift"
    
    func asPromptText() -> String {
        switch self {
        case .swift:
            return swiftReviewPrompt()
        }
    }
    
    static var supportedLanguages: String {
        self.allCases.map { $0.rawValue }.joined(separator: ", ")
    }
    
}
