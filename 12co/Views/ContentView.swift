//
//  ContentView.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import NavigationTransitions // https://github.com/davdroman/swiftui-navigation-transitions?ref=iosexample.com
import SwiftUI

struct ContentView: View {
    fileprivate static let LOGO_DURATION: TimeInterval = 2

    @State var showLogoScreen: Bool = true

    var body: some View {
        ZStack {
            if self.showLogoScreen {
                LogoScreen()
            } else {
                NavigationStack {
                    // TODO: handle login
                    AccountTypeView()
                }
                .navigationTransition(.fade(.in).combined(with: .fade(.out)))
                .tint(.accent)
            }
        }
        .onAppear {
            self.startTimer()
        }
    }

    fileprivate func startTimer() {
        Timer.scheduledTimer(withTimeInterval: ContentView.LOGO_DURATION,
                             repeats: false)
        { _ in
            withAnimation {
                self.showLogoScreen = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
