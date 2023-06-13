//
//  Utilities.swift
//  12co
//
//  Created by Joel Frank on 6/13/23.
//

import Foundation
import UIKit

internal func closeKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
