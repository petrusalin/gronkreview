//
//  Request.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

protocol Request {
    func asURLRequest() throws -> URLRequest 
}
