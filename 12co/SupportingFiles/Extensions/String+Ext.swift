//
//  String+Ext.swift
//  12co
//
//  Created by Joel Frank on 6/13/23.
//

import Foundation
import SwiftUI

extension String {
    func clean() -> String? {
        return count == 0 ? nil : self
    }

    func matches(regex: String) -> Bool {
        range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    func fileName() -> String {
        URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }

    func fileExtension() -> String {
        URL(fileURLWithPath: self).pathExtension
    }

    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
