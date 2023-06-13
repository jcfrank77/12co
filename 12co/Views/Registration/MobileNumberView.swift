//
//  MobileNumberView.swift
//  12co
//
//  Created by Joel Frank on 6/13/23.
//

import SwiftUI

struct MobileNumberView: View {
    @StateObject var viewModel: MobileNumberViewModel = .init()

    var body: some View {
        VStack(spacing: 0) {
            Text("Mobile number")
                .font(.medHeavy)
                .leftJustify()
        }
    }
}

struct MobileNumberView_Previews: PreviewProvider {
    static var previews: some View {
        MobileNumberView()
    }
}
