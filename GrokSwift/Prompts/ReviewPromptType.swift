//
//  ReviewPromptType.swift
//  GrokSwift
//
//  Created by Alin Petrus on 09.10.2024.
//

import Foundation

enum ReviewPromptType: ReviewPrompt {
    case swift
    
    func asPromptText() -> String {
        switch self {
        case .swift:
            return self.swiftReviewPrompt()
        }
    }
    
    private func swiftReviewPrompt() -> String {
        """
        You will be asked to code review a piece of swift code.
        
        The following should be considered highly important:
        - SOLID principles should be followed (Single responsability principle, Open-Closed principle, Liskow substitution principle, Interface Segregation principle, Dependecy Inversion principle)
        - KISS Principle (Keep it simple)
        - DRY Principle (Do not repeat yourself)
        - Prefer using Swift 6
        - Use async await/structured concurency instead of GCD or other threading mechanisms
        - Use actors instead of other thread safe access mechanisms
        - Make data structures Sendable
        - async tasks should be run in paralel if possible (using async let or TaskGroups)
        - tasks should be canceled on deinit
        - Prefer Protocol Oriented Programming approach
        - make sure memory management is taken into consideration and that retain cycles are not present
        - if using the Combine framework, make sure the cancelables/subscription memory management is correct
        - use MVVM architecture
        - check that the code is unit tested
        - do not allow TO DO: comments in code, prefer `#warnings(TO DO: JIRA TASK WHERE IT WILL BE IMPLEMENTED)`
        - prefer structs for non shareable data types over classes
        - try to make classes final
        - correctly use access specifiers as open, public, private, internal, private
        - Do not allow singleton access internally - even if it is a singleton, pass it as a dependency to a data struture
        - do not allow force unwrapping of optionals, with some exceptions (property will be non-nil by the end of init or did load if in a view controller, is a private property and is only set once in code)
        - mark unavailable functions/initializers with available(*, unavailable), not just fatal inside them
        - make view models let constants and non optional - for this use inits that accept them as parameters
        - prefer named data types like structs over tuples
        - no empty functions or functions that only call super
        - do not allow extensions abuse over a single file to hide multiple responsibilities of a data structure. Refactor code to use multiple data structures
        - do not prefix data types in swift like in Objective-C. Data types are namespaced by modules in swift
        - follow naming conventions from https://www.swift.org/documentation/api-design-guidelines/
        - follow a few best practices to have better compile times:  https://developer.apple.com/documentation/xcode/improving-build-efficiency-with-good-coding-practices
        - no imports that are not required
        - use immutable state where possible
        - return and treat errors from functions, not just print a message
        - make sure dark mode is supported
        - make sure strings are localised
        -  add accessibility identifiers where possible
        - a view model should be completely marked as main actor as it will be used on the UI - even if it runs async code internally, it will always complete and access internal state on main
        - SwiftUI - ownership - correctly use StateObject, State, ObservableObject
        - POJOS/DTOS and other data entities should be structures. Also they could probably be identifiable and Hashable - useful for SwiftUI
        - avoid defaulting values for identifiers on init, prefer having failable initialisers and return nil if we miss an id
        - avoid doing custom hashable implementation - might end up with the same hash for multiple instances
        - do not abuse lazy vars, especially just to have cleaner inits.
        - avoid existentials. Use generics/some and/or some sort of type erasure
        - Number of data structures per file? 1 unless that other data structures are defined internally in the main data structure - avoid multiple nesting levels, keep it to 1
        - Number of data structures per file? 1 unless that other data structures are defined internally in the main data structure - avoid multiple nesting levels, keep it to 1
        - No extensions of unrelated data structures in a file that defines another data structure
        - define structures for related parameters and send them as a sing
        - use empty enums as factories instead of classes or structures
        - do not mix actors and gcd. Main actor won't help with a concurrent operation that is not on the main queue
        - do not use type inference, specify type for better build times
        - do not use UIContentConfiguration for cells, prefer having dedicated views which can be configured and embedded in cells. It will avoid doing all the castings and unhandled scenarios/fatal errors
        - when doing initialisations in maps/compactMaps, use the named Constructor call  instead of .init() which uses type inference and is slower
        - add documentation/comments for public interfaces
        - use guards and return early instead of doing if else logic
        - do not duplicate code
        - code should be reusable
        - make sure code is understandable, by naming, formatting, and how long or complex a datastructure/function is
        - try to return values from functions that can return any viable information (an add function can return a bool for example instead of void, a remove could return an optional for the removed element)
        - mark functions that can have the return type ignored with @discardableResult
        - use design patterns where applicable: https://refactoring.guru/design-patterns/catalog
        - enums can be used as a namespace, if it makes sense to define multiple data structures under the same enum to tightly bind their usage (intent at least)
        - use background tasks if running a long process that should be able to continue in the background
        - do not print sensitive information in the console or log it in a file
        - do not leave any print function calls in code, use OSlog
        - use constants instead of plain values, make them a static let to a data structure they are associated to
        - statically define date formatters one on a data structure, especially for cells. do not reinit each time, it is expensive
        - make sure cells are reused (registered and dequeued) if using UIKIt
        - make sure to use lazy stacks or lists when loading a large amount of items in SwiftUI
        - make sure to use lazy stacks or lists when loading a large amount of items in SwiftUI
        - make sure permissions are granted for APIs like Camera, Contacts, Tracking, Location, any iOS API that the user needs to agree to share information with the application. Graciously handle denial of usage.
        - use option sets for configurations that allow a mixture of different option flags instead of multiple boolean values
        - Avoid passing nested observable objects to a SwiftUI View. Plan a view to use view classes that do not reference other classes (or at least hide) it. Pass along only simple data types (structures) where possible
        - make sure to correctly work with strings if going over characters or counting. Grapheme clusters  should be used, not characters. An emoji might be composed of multiple unicode characters
        - do not do any view work on view controller init. the views are not loaded yet. it is only safe after/in viewDidLoad
        - user data should be secure
        - API keys should not be stored plain in code
        
        Only provide feedback if any of the above requirements is violated. If ok or not applicable, no feedback is needed.
        
        The code to review is the following:
        """
    }
}
