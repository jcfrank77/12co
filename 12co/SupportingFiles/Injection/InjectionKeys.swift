//
//  InjectionKeys.swift
//
//  Created by Joel on 23/12/2021.
//

import CloudKit
import Foundation
import UIKit

// Adapted from: https://www.avanderlee.com/swift/dependency-injection/
public protocol InjectionKey {
    /// The associated type representing the type of the dependency injection key's value.
    associatedtype Value

    /// The default value for the dependency injection key.
    static var currentValue: Self.Value { get set }
}

private struct NetworkProviderKey: InjectionKey {
    static var currentValue: NetworkProvider = NetworkService()
}

private struct RegistrationProviderKey: InjectionKey {
    static var currentValue: RegistrationProvider = RegistrationService()
}

extension InjectedValues {
    var networkService: NetworkProvider {
        get { Self[NetworkProviderKey.self] }
        set { Self[NetworkProviderKey.self] = newValue }
    }

    var registrationService: RegistrationProvider {
        get { Self[RegistrationProviderKey.self] }
        set { Self[RegistrationProviderKey.self] = newValue }
    }
}
