//
//  main.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

func run() async {
    guard CommandLine.arguments.count == 2 else {
        print("Usage: ./GrokSwift {SwiftFilePath}.swift")
        return
    }
    let filePath = CommandLine.arguments[1]
    
    guard filePath.components(separatedBy: ".").last == "swift" else {
        print("Usage: ./GrokSwift {SwiftFilePath}.swift")
        return
    }
    
    guard let data = FileManager.default.contents(atPath: filePath),
    let code = String(data: data, encoding: .utf8) else {
        print("Error: Empty file to review")
        
        return
    }
    
    let service = GrokReviewService()
    
    do {
        let review = try await service.requestReview(withContent: code, 
                                                     prompt: ReviewPromptType.swift)
        
        // should write to a file
        review.choices.forEach { choice in
            print("========================================")
            print("\n")
            print(choice.message.content)
            print("\n")
            print("========================================")
        }
    } catch {
        print(error)
    }

}

await run()

