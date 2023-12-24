//
//  LoginView.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import SwiftUI
import MainDish

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button("Login") {
                Task {
                    await viewModel.loginSelected()
                }
            }
            .padding()
            
            Button("Register") {
                Task {
                    await viewModel.register()
                }
            }
            .padding()
        }
        .padding()
//        .alert(isPresented: $viewModel.hasFinishedLogin, content: {
//            Alert(title: Text("User has been authenticated"))
//        })
    }
}

//#Preview {
//    LoginView(viewModel: LoginViewModel(
//        loginUseCase: UseCaseSender.makeEmpty(),
//        registerUseCase: UseCaseSender.makeEmpty())
//    )
//}
//
