//
//  MobileNumberViewModel.swift
//  12co
//
//  Created by Joel Frank on 6/13/23.
//

import Foundation

class MobileNumberViewModel: ObservableObject {
    @Published var countryCode: String = ""
    @Published var phoneNumber: String = ""

    @Published var showCountryCodePicker: Bool = false

    @Published var phoneNumberEdited: Bool = false

    var commonCountryCodes: [String] = []
    var countryCodes: [String] = []

    var countryCodeIsValid: Bool { countryCode.clean() != nil }
    var phoneNumberIsValid: Bool { PhoneNumberValidator(phoneNumber.trimmed).isValid }
    var infoIsValid: Bool { countryCodeIsValid && phoneNumberIsValid }

    var showPhoneNumberError: Bool { phoneNumberEdited && !phoneNumberIsValid }

    init() {
        setupCountryCodes()
    }

    func countryCodeSelected(code: String) {
        countryCode = "+\(CountryPhoneCodes.prefixes[code]!) \(Locale.current.localizedString(forRegionCode: code)!)"
        showCountryCodePicker = false
    }

    fileprivate func setupCountryCodes() {
        let commonCodeSet: Set<String> = ["US", "GB", "MX", "IN", "CN"]

        countryCodes = NSLocale.isoCountryCodes.filter { !commonCodeSet.contains($0) }
        countryCodes.sort(by: countrySorter)

        commonCountryCodes = Array(commonCodeSet)
        commonCountryCodes.sort(by: countrySorter)
    }

    fileprivate func countrySorter(a: String, b: String) -> Bool {
        Locale.current.localizedString(forRegionCode: a) ?? "" < Locale.current.localizedString(forRegionCode: b) ?? ""
    }

    func sendMobileVerification() {}
}
