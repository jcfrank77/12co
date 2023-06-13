//
//  PersonalInfoViewModel.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import Foundation

class PersonalInfoViewModel: ObservableObject {
    @Injected(\.registrationService) fileprivate var registrationService: RegistrationProvider

    @Published var emailAddress: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var dateOfBirth: Date = .now
    @Published var dateOfBirthString: String = ""

    @Published var showDatePicker: Bool = false

    @Published var emailEdited: Bool = false
    @Published var firstNameEdited: Bool = false
    @Published var lastNameEdited: Bool = false

    fileprivate var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }

    var emailIsValid: Bool { EmailValidator(emailAddress.trimmed).isValid }
    var firstNameIsValid: Bool { NameValidator(firstName.trimmed).isValid }
    var lastNameIsValid: Bool { NameValidator(lastName.trimmed).isValid }
    var dobIsValid: Bool { NameValidator(dateOfBirthString.trimmed).isValid }
    var infoIsValid: Bool { emailIsValid && firstNameIsValid && lastNameIsValid && dobIsValid }

    var showEmailError: Bool { emailEdited && !emailIsValid }
    var showFirstNameError: Bool { firstNameEdited && !firstNameIsValid }
    var showLastNameEmailError: Bool { lastNameEdited && !lastNameIsValid }

    func updateDobString() {
        dateOfBirthString = dateFormatter.string(from: dateOfBirth)
    }

    func savePersonalInfo() {
        registrationService.setPersonalInfo(email: emailAddress,
                                            firstName: firstName,
                                            lastName: lastName,
                                            dateOfBirth: dateOfBirth)
    }
}
