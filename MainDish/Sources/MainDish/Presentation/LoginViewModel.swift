//
//  LoginViewModel.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation
import Combine

@MainActor
public class LoginViewModel: ObservableObject {
    @Published public var email: String = ""
    @Published public var password: String = ""
    @Published public var errorMessage: String?
    @Published public var hasFinishedLogin: Bool = false
    @Published public var hasFinishedRegister: Bool = false
    
    private var loginUseCase: LoginUseCase
    private var registerUseCase: RegisterCustomerUseCase
    
    
    private var hasValidCredentials: Bool {
        !hasEmptyField && email.contains("@")
    }
    
    private var hasEmptyField: Bool {
        email.isEmpty || password.isEmpty
        
    }
    
    public init(loginUseCase: LoginUseCase, registerUseCase: RegisterCustomerUseCase) {
        self.loginUseCase = loginUseCase
        self.registerUseCase = registerUseCase
    }
    
    public func loginSelected() async {
        guard !hasEmptyField else {
            errorMessage = "Fields are empty"
            return
        }

        do {
            try await loginUseCase.login(email: email, password: password)
            hasFinishedLogin = true
        } catch is InvalidCredentialsException {
            errorMessage = "Invalid credentials"
        } catch {}
    }
    
    public func register() async {
        guard !hasEmptyField else {
            errorMessage = "Fields are empty"
            return
        }
        
        
        do {
            try await registerUseCase.register(customer: Customer(id: UUID(), name: "Adrian", email: email, deliveryAddress: "Cluj, Romania"), password: password)
            hasFinishedRegister = true
        } catch is InvalidCredentialsException {
            errorMessage = "Invalid credentials"
        } catch {}
        
        
    }
}
