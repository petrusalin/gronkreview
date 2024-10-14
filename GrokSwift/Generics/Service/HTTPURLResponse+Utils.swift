//
//  HTTPURLResponse+Utils.swift
//  GrokSwift
//
//  Created by Alin Petrus on 14.10.2024.
//

import Foundation

extension HTTPURLResponse {
    var isSuccess: Bool { statusCode >= 200 && statusCode <= 299 }
    
    var responseError: NetworkError? {
        guard !self.isSuccess else { return nil }
        
        switch statusCode {
        case 401:
            return .tokenExpired
        case 500...599:
            return .internalServerError
        default:
            return .generic
        }
    }
}
