//
//  GrokChoice.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

struct GrokChoice: Decodable {
    let index: Int
    let message: GrokContent
    var finishReason: String?
}
