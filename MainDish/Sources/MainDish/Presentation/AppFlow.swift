//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 24.12.2023.
//

import Foundation

final public class AppFlow: ObservableObject {
    @Published public private(set) var loginViewModel: LoginViewModel?
    private let loginUseCase: LoginUseCase
    private let registerUseCase: RegisterCustomerUseCase
    
    public init(loginUseCase: LoginUseCase, registerUseCase: RegisterCustomerUseCase) {
        self.loginUseCase = loginUseCase
        self.registerUseCase = registerUseCase
    }
    
    public func start() {
        loginViewModel = LoginViewModel(
            loginUseCase: loginUseCase,
            registerUseCase: registerUseCase
        )
    }
}
