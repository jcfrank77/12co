//
//  AccountTypeView.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import SwiftUI

struct AccountTypeView: View {
    @StateObject var viewModel: AccountTypeViewModel = .init()

    var body: some View {
        VStack(spacing: 0) {
            Text("Type of account")
                .font(.medHeavy)
                .leftJustify()

            Toggle("Business account", isOn: $viewModel.isBusinessAccount)
                .font(.med)
                .tint(Color.green)
                .padding(.top, Spacing.med)

            Divider()
                .background(Color.accent)
                .frame(height: 1)
                .padding(.top, Spacing.xSmall)

            Toggle("Personal account", isOn: $viewModel.isPersonalAccount)
                .font(.med)
                .tint(Color.green)
                .padding(.top, Spacing.med)

            Divider()
                .background(Color.accent)
                .frame(height: 1)
                .padding(.top, Spacing.xSmall)

            NavigationLink(destination: PersonalInfoView().onAppear {
                self.viewModel.setAccountType()
            }) {
                Text("continue")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.top, Spacing.med)

            Spacer()
        }
        .padding(Spacing.large)
    }
}

struct AccountTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTypeView()
    }
}
