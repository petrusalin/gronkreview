//
//  main.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

private func run() async {
    guard CommandLine.arguments.count == 4 else {
        print(usage())
        return
    }
    
    let filePath = CommandLine.arguments[3]
    let key = CommandLine.arguments[2]
    let serviceTypeString = CommandLine.arguments[1]
    
    guard let type = ServiceType(rawValue: serviceTypeString),
          let language = filePath.components(separatedBy: ".").last else {
        print(usage())
        return
    }
    
    guard let languageType = ReviewPromptType(rawValue: language) else {
        print("\(language) not supported for review yet")
        return
    }
    
    guard let data = FileManager.default.contents(atPath: filePath),
    let code = String(data: data, encoding: .utf8) else {
        print("Error: Empty file to review")
        return
    }
    
    let service = ServiceFactory.service(forType: type)
    
    do {
        let review = try await service.requestReview(apiKey: key,
                                                     withContent: code, 
                                                     prompt: languageType)
        
        print(review.asText())
    } catch {
        print("Got an error: \(error.localizedDescription)")
    }

}

private func usage() -> String {
    "Usage: ./GrokSwift {serviceName (openAI / groq)} {apiKey} {FilePath.languageExtension}"
}

await run()

