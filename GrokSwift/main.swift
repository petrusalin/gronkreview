//
//  main.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

private func review() async {
    guard CommandLine.arguments.count == 4 else {
        print("Incorrect number of parameters. \n\(usage())")
        return
    }
    
    let filePath = CommandLine.arguments[3]
    let key = CommandLine.arguments[2]
    let serviceTypeString = CommandLine.arguments[1]
    
    guard let type = ServiceType(rawValue: serviceTypeString)
           else {
        print("Service not supported!. \n\(usage()) ")
        return
    }
    
    guard let language = filePath.components(separatedBy: ".").last,
          let  languageType = ReviewPromptType(rawValue: language) else {
        print("Language not supported for review yet. \n\(usage())")
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
        print("Got an error while doing the review: \(error.localizedDescription)")
    }

}

private func usage() -> String {
    """
    Usage: ./GrokSwift { serviceName } {apiKey} {FilePath.languageExtension}
    
     - Supported languages:
        \(ReviewPromptType.supportedLanguages)
     - Supported services:
        \(ServiceType.supportedServices)
    """
}

await review()

