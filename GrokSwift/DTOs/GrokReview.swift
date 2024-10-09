//
//  GrokReview.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

struct GrokReview: Decodable {
    let id: String
    let object: String
    let model: String
    let created: Int
    let choices: [GrokChoice]
    let usage: GrokUsage
}
