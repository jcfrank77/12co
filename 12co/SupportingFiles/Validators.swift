//
//  Validators.swift
//  12co
//
//  Created by Joel Frank on 6/13/23.
//

import Foundation

protocol Validator {
    var isValid: Bool { get }
}

struct NameValidator: Validator {
    fileprivate static let MIN_NAME_LENGTH: Int = 2

    let isValid: Bool

    init(_ string: String) {
        self.isValid = string.clean()?.count ?? 0 >= NameValidator.MIN_NAME_LENGTH
    }
}

struct EmailValidator: Validator {
    let isValid: Bool

    init(_ string: String) {
        let regex = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_'{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_'{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
            "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        self.isValid = predicate.evaluate(with: string)
    }
}

struct PhoneNumberValidator: Validator {
    let isValid: Bool

    init(_ string: String) {
        let regex = " ^[\\+]?[(]?[0-9]{3}[)]?[-\\s\\.]?[0-9]{3}[-\\s\\.]?[0-9]{4,6}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        self.isValid = predicate.evaluate(with: string)
    }
}
