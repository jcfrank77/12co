//
//  AccountTypeViewModel.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import Combine
import Foundation

class AccountTypeViewModel: ObservableObject {
    @Injected(\.registrationService) fileprivate var registrationService: RegistrationProvider

    @Published var isBusinessAccount: Bool = false
    @Published var isPersonalAccount: Bool = true

    fileprivate var subscribers: Set<AnyCancellable> = []
    fileprivate var updatingOtherToggle: Bool = false

    init() {
        $isBusinessAccount.sink { (newValue: Bool) in
            if self.updatingOtherToggle { return }

            if newValue != self.isPersonalAccount { return }

            DispatchQueue.main.async {
                self.updatingOtherToggle = true
                self.isPersonalAccount = !self.isBusinessAccount
                self.updatingOtherToggle = false
            }
        }.store(in: &subscribers)

        $isPersonalAccount.sink { (newValue: Bool) in
            if self.updatingOtherToggle { return }

            if newValue != self.isBusinessAccount { return }

            DispatchQueue.main.async {
                self.updatingOtherToggle = true
                self.isBusinessAccount = !self.isPersonalAccount
                self.updatingOtherToggle = false
            }
        }.store(in: &subscribers)
    }

    func setAccountType() {
        registrationService.setAccountType(isBusinessAccount ? .business : .personal)
    }
}
