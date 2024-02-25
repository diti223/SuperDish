//
//  LoginView.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            HStack {
                Button("Login") {
                    Task {
                        await viewModel.loginSelected()
                    }
                }.frame(minWidth: 140)
                
                Button("Register") {
                    Task {
                        await viewModel.register()
                    }
                }.frame(minWidth: 140)
            }
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
