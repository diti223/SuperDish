//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 24.12.2023.
//

import Foundation
import Combine

final public class AppFlow: ObservableObject {
    @Published public private(set) var loginViewModel: LoginViewModel?
    @Published public private(set) var homeFlow: HomeFlow?
    @Published public var authenticatedEmail: String?
    private let secureStorage: LocalStorage = UserDefaultsStorage(userDefaults: .standard)
    private let loginUseCase: LoginUseCase
    private let registerUseCase: RegisterCustomerUseCase
    private static let authenticatedEmailKey = "kAuthenticatedEmailKey"
    var subscribers: Set<AnyCancellable> = []
    
    public init(loginUseCase: LoginUseCase, registerUseCase: RegisterCustomerUseCase) {
        self.loginUseCase = loginUseCase
        self.registerUseCase = registerUseCase
        
        
    }
    
    public func start() {
        if let email: String = secureStorage[Self.authenticatedEmailKey] {
            startAuthorizedApp(email: email)
        } else {
            startAuthentication()
        }
    }
    
    
    private func startAuthorizedApp(email: String) {
        self.homeFlow = HomeFlow(email: email)
    }
    
    private func startAuthentication() {
        loginViewModel = LoginViewModel(
            loginUseCase: loginUseCase.addPersistence(
                storage: secureStorage,
                authenticatedEmailKey: Self.authenticatedEmailKey
            ),
            registerUseCase: registerUseCase
        )
        
        loginViewModel?.finishedPublisher.sink { [weak self] in
            self?.start()
        }
        .store(in: &subscribers)
    }
}

