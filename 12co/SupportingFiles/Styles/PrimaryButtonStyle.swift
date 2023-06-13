//
//  PrimaryButtonStyle.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool

    fileprivate static let isPressedOpacity: CGFloat = 0.6
    fileprivate static let disabledOpacity: CGFloat = 0.3

    func makeBody(configuration: Configuration) -> some View {
        let pressedOpacity: CGFloat = configuration.isPressed ? PrimaryButtonStyle.isPressedOpacity : 1

        return configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .border(Color.accent, width: 4)
            .opacity(isEnabled ? pressedOpacity : PrimaryButtonStyle.disabledOpacity)
            .allowsHitTesting(isEnabled)
    }
}
