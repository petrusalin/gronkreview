//
//  ServiceFactory.swift
//  GrokSwift
//
//  Created by Alin Petrus on 10.10.2024.
//

import Foundation

enum ServiceFactory {
    
    static func service(forType serviceType: ServiceType) -> some ReviewService {
        switch serviceType {
        case .groq:
            return GrokReviewService()
        }
    }
    
}
