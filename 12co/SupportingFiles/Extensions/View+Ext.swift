//
//  View+Ext.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import Foundation
import SwiftUI

let FADE_IN_OUT_DELAY: TimeInterval = 0.3

// https://stackoverflow.com/a/58606176/83370
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct HideDefaultBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content.scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }

    func fillParent() -> some View {
        return frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func fadeInOut() -> some View {
        transition(AnyTransition.opacity.animation(.easeInOut(duration: FADE_IN_OUT_DELAY)))
    }

    func leftJustify() -> some View {
        frame(maxWidth: .infinity, alignment: .leading)
    }

    func underlined(color: Color, thickness: CGFloat = 2) -> some View {
        padding(.vertical, 10)
            .overlay(Rectangle().frame(height: thickness).padding(.top, 35))
            .foregroundColor(color)
            .padding(10)
    }
}
