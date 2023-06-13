//
//  LogoScreen.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import SwiftUI

struct LogoScreen: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Image(colorScheme == .dark ? "appstoreDark" : "appstore")
                .resizeableFit()
                .frame(width: 240)
        }
    }
}

struct LogoScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogoScreen()
    }
}
