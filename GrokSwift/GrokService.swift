//
//  GrokService.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

final class GrokReviewService {
    private let session: URLSession = URLSession.shared
    
    func requestReview(withContent content: String) async throws -> String {
        
        let request = GrokRequest(content: content)
        
        self.session.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, (any Error)?) -> Void#>)
    }
    
}
