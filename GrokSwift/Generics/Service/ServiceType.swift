//
//  ServiceType.swift
//  GrokSwift
//
//  Created by Alin Petrus on 10.10.2024.
//

import Foundation

enum ServiceType: String, CaseIterable {
    case groq
    case openAI
    
    static var supportedServices: String {
        self.allCases.map { $0.rawValue }.joined(separator: ", ")
    }
}
