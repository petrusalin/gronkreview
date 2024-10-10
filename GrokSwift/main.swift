//
//  main.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

func run() async {
    guard CommandLine.arguments.count == 3 else {
        print("Usage: ./GrokSwift {SwiftFilePath}.swift {apiKey}")
        return
    }
    let filePath = CommandLine.arguments[1]
    let key = CommandLine.arguments[2]
    
    guard filePath.components(separatedBy: ".").last == "swift" else {
        print("Usage: ./GrokSwift {SwiftFilePath}.swift {apiKey}")
        return
    }
    
    guard let data = FileManager.default.contents(atPath: filePath),
    let code = String(data: data, encoding: .utf8) else {
        print("Error: Empty file to review")
        
        return
    }
    
    let service = ServiceFactory.service(forType: .groq)
    
    do {
        let review = try await service.requestReview(apiKey: key,
                                                     withContent: code, 
                                                     prompt: ReviewPromptType.swift)
        
        print(review.asText())
    } catch {
        print("Got an error: error")
    }

}

await run()

