//
//  LoginViewModel.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation
import Combine

public class LoginViewModel: ObservableObject {
    @Published public var email: String = ""
    @Published public var password: String = ""
    @Published public var errorMessage: String?
    public var finishedPublisher = PassthroughSubject<Void, Never>()
    
    private var loginUseCase: LoginUseCase
    private var registerUseCase: RegisterCustomerUseCase
    
    private var hasEmptyField: Bool {
        email.isEmpty || password.isEmpty
        
    }
    
    public init(loginUseCase: LoginUseCase, registerUseCase: RegisterCustomerUseCase) {
        self.loginUseCase = loginUseCase
        self.registerUseCase = registerUseCase
    }
    
    public func loginSelected() async {
        errorMessage = ""
        guard !hasEmptyField else {
            errorMessage = "Fields are empty"
            return
        }

        do {
            try await loginUseCase.login(
                email: email,
                password: password
            )
            finishedPublisher.send()
        } catch is LoginFailedException {
            errorMessage = "Invalid credentials"
        } catch {}
    }
    
    public func register() async {
        errorMessage = ""
        guard !hasEmptyField else {
            errorMessage = "Fields are empty"
            return
        }
        
        
        do {
            try await registerUseCase.register(
                customer: Customer(
                    id: UUID(),
                    name: "Adrian",
                    email: email,
                    deliveryAddress: "Cluj, Romania"
                ),
                password: password
            )
            finishedPublisher.send()
        } catch {
            errorMessage = "Invalid credentials"
        }
        
        
    }
}
