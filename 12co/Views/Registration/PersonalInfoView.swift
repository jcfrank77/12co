//
//  PersonalInfoView.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import SwiftUI

struct PersonalInfoView: View {
    @StateObject var viewModel: PersonalInfoViewModel = .init()

    enum Field {
        case email
        case lastName
        case firstName
    }

    @FocusState fileprivate var currentField: Field?

    var body: some View {
        VStack(spacing: 0) {
            Text("Personal information")
                .font(.medHeavy)
                .leftJustify()

            Group {
                Text("Email address")
                    .font(.med)
                    .leftJustify()
                    .padding(.top, Spacing.med)
                TextField("",
                          text: $viewModel.emailAddress,
                          prompt: Text(verbatim: "email@example.com"))
                    .focused($currentField, equals: .email)
                    .onSubmit { self.currentField = .firstName }
                    .onChange(of: self.currentField, perform: { _ in
                        self.updateEditingHistory()
                    })
                    .keyboardType(.emailAddress)
                    .padding(.top, Spacing.xSmall)
                Divider()
                    .background(self.viewModel.showEmailError ? .red : .accent)
                    .frame(height: 1)
            }

            Group {
                Text("First name")
                    .font(.med)
                    .leftJustify()
                    .padding(.top, Spacing.med)
                TextField("Adam",
                          text: $viewModel.firstName)
                    .focused($currentField, equals: .firstName)
                    .onSubmit { self.currentField = .lastName }
                    .onChange(of: self.currentField, perform: { _ in
                        self.updateEditingHistory()
                    })
                    .keyboardType(.default)
                    .padding(.top, Spacing.xSmall)
                Divider()
                    .background(self.viewModel.showFirstNameError ? .red : .accent)
                    .frame(height: 1)
            }

            Group {
                Text("Last name")
                    .font(.med)
                    .leftJustify()
                    .padding(.top, Spacing.med)
                TextField("Smith",
                          text: $viewModel.lastName)
                    .focused($currentField, equals: .lastName)
                    .onChange(of: self.currentField, perform: { _ in
                        self.updateEditingHistory()
                    })
                    .keyboardType(.default)
                    .padding(.top, Spacing.xSmall)
                Divider()
                    .background(self.viewModel.showLastNameEmailError ? .red : .accent)
                    .frame(height: 1)
            }

            Group {
                Text("Date of birth")
                    .font(.med)
                    .leftJustify()
                    .padding(.top, Spacing.med)

                Button {
                    self.viewModel.showDatePicker = true
                } label: {
                    TextField("10 July 1970",
                              text: $viewModel.dateOfBirthString)
                        .font(.med)
                        .multilineTextAlignment(.leading)
                        .allowsHitTesting(false)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, Spacing.xSmall)
                .popover(isPresented: $viewModel.showDatePicker) {
                    datePicker
                        .presentationCompactAdaptation((.popover))
                }

                Divider()
                    .background(Color.accent)
                    .frame(height: 1)
            }

            NavigationLink(destination: MobileNumberView().onAppear {
                self.viewModel.savePersonalInfo()
            }) {
                Text("continue")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.top, Spacing.med)
            .disabled(!self.viewModel.infoIsValid)

            Spacer()
        }
        .padding(Spacing.large)
    }

    fileprivate var datePicker: some View {
        VStack {
            DatePicker(selection: $viewModel.dateOfBirth,
                       in: ...Date.now,
                       displayedComponents: .date)
            {
                EmptyView()
            }
            .datePickerStyle(.wheel)
            .onChange(of: viewModel.dateOfBirth, perform: { _ in
                self.viewModel.updateDobString()
            })
            .frame(width: 300)
        }
    }

    fileprivate func updateEditingHistory() {
        switch currentField {
        case .email: viewModel.emailEdited = true
        case .firstName: viewModel.firstNameEdited = true
        case .lastName: viewModel.lastNameEdited = true
        default: ()
        }
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
    }
}
