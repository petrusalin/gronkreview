//
//  Request.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case encoding
}

protocol Request {
    func asURLRequest() throws -> URLRequest 
}
