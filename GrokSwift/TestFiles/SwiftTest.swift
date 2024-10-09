//
//  SwiftTest.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

protocol InsideDelegate: AnyObject {
    func insideDidSomething()
}

@MainActor
class ReviewTest {
    class Inside {
        private weak var delegate: InsideDelegate?
        private let actionBlock: (() -> Void)
    
        init(delegate: InsideDelegate, actionBlock: @escaping (() -> Void)) {
            self.delegate = delegate
            self.actionBlock = actionBlock
        }
        
        func doSomething() {
            self.actionBlock()
            self.delegate?.insideDidSomething()
        }
    }
    
    struct Sandwich: Identifiable, Hashable {
        let id: String
        let ingredients: [String]
        
        func make() {
            print("Made a sandwich with \(ingredients)")
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.id)
        }
    }
    
    let id: String
    var name: String!
    var inside: Inside!
    
    init() {
        self.id = UUID().uuidString
        self.name = ""
        self.inside = Inside(delegate: self) {
            self.exit()
        }
    }
    
    func test() {
        self.inside.doSomething()
    }
    
    func makeSandwich() async throws {
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        var veggieSandwich = Sandwich(id: "1", ingredients: ["Bread", "Tomato", "Lettuce"])
        veggieSandwich.make()
        let meatSandwich = Sandwich(id: "1", ingredients: ["Bread", "Salami", "Cheddar", "Pickles", "Mustard"])
        meatSandwich.make()
    }
    
    nonisolated func explode(_ completion: () -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.test()
        }
    }
    
    func run() {
        test()
        Task {
            try? await makeSandwich()
        }
        explode {
            print("BOOM")
        }
    }
    
    func exit() {
        // TO DO:
    }
    
}

extension ReviewTest: InsideDelegate {
    func insideDidSomething() {
        print("Did something")
    }
    
}
