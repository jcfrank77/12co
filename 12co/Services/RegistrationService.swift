//
//  RegistrationService.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import Foundation

protocol RegistrationProvider {
    func setAccountType(_ type: AccountType)
    func setPersonalInfo(email: String, firstName: String, lastName: String, dateOfBirth: Date)
}

class RegistrationService: RegistrationProvider {
    fileprivate var newAccount: Account? = nil

    func setAccountType(_ type: AccountType) {
        if newAccount == nil {
            newAccount = Account()
        }

        newAccount?.type = type
    }

    func setPersonalInfo(email: String, firstName: String, lastName: String, dateOfBirth: Date) {
        guard let newAccount = newAccount else {
            fatalError("new account must already be set")
        }

        newAccount.email = email
        newAccount.firstName = firstName
        newAccount.lastName = lastName
        newAccount.dateOfBirth = dateOfBirth
    }
}
