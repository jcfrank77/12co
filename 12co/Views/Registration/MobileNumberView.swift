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

            Group {
                Text("Country code")
                    .font(.med)
                    .leftJustify()
                    .padding(.top, Spacing.med)
                Button {
                    viewModel.showCountryCodePicker = true
                } label: {
                    TextField("+1 United States", text: $viewModel.countryCode)
                        .multilineTextAlignment(.leading)
                        .allowsHitTesting(false)
                }
                .leftJustify()
                .padding(.top, Spacing.xSmall)

                Divider()
                    .background(Color.accent)
                    .frame(height: 1)
            }

            Group {
                Text("Phone number")
                    .font(.med)
                    .leftJustify()
                    .padding(.top, Spacing.med)
                TextField("888 867 5309",
                          text: $viewModel.phoneNumber)
                    .onChange(of: viewModel.phoneNumber, perform: { _ in
                        viewModel.phoneNumberEdited = true
                    })
                    .keyboardType(.phonePad)
                    .padding(.top, Spacing.xSmall)
                Divider()
                    .background(self.viewModel.showPhoneNumberError ? .red : .accent)
                    .frame(height: 1)
            }

            NavigationLink(destination: MobileNumberView().onAppear {
                self.viewModel.sendMobileVerification()
            }) {
                Text("Continue")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.top, Spacing.med)
            .disabled(!self.viewModel.infoIsValid)

            Spacer()
        }
        .padding(Spacing.large)
        .contentShape(Rectangle())
        .onTapGesture { closeKeyboard() }
        .sheet(isPresented: $viewModel.showCountryCodePicker, content: { countryCodePicker })
    }

    fileprivate var countryCodePicker: some View {
        List {
            ForEach([viewModel.commonCountryCodes, viewModel.countryCodes], id: \.self) { codes in
                Section {
                    ForEach(codes, id: \.self) { countryCode in
                        if let prefix: String = CountryPhoneCodes.prefixes[countryCode] {
                            Button {
                                viewModel.countryCodeSelected(code: countryCode)
                            } label: {
                                HStack {
                                    Text("+\(prefix)")
                                        .frame(width: 60)
                                        .multilineTextAlignment(.leading)
                                    Text(Locale.current.localizedString(forRegionCode: countryCode) ?? "")
                                    Spacer()
                                }
                            }
                            .foregroundColor(.accent)
                        }
                    }
                }
            }
        }
    }
}

struct MobileNumberView_Previews: PreviewProvider {
    static var previews: some View {
        MobileNumberView()
    }
}
