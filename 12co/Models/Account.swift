//
//  Account.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import Foundation

enum AccountType {
    case business
    case personal
}

class Account {
    var type: AccountType = .personal

    var email: String?
    var firstName: String?
    var lastName: String?
    var dateOfBirth: Date?
}
