//
//  Injected.swift
//
//  Created by Joel on 23/12/2021.
//

import Foundation


// Adapted from: https://www.avanderlee.com/swift/dependency-injection/
@propertyWrapper
struct Injected<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>
    var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}
