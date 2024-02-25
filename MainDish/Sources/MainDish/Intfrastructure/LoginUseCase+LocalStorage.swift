//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.02.2024.
//

import Foundation

extension LoginUseCase {
    func addPersistence(storage: LocalStorage, authenticatedEmailKey: String) -> LoginUseCase {
        LoginPersistenceDecorator(
            useCase: self,
            storage: storage,
            authenticatedEmailKey: authenticatedEmailKey
        )
    }
}

fileprivate struct LoginPersistenceDecorator: LoginUseCase {
    let useCase: LoginUseCase
    let storage: LocalStorage
    let authenticatedEmailKey: String
    
    func login(email: String, password: String) async throws {
        try await useCase.login(email: email, password: password)
        storage.store(value: email, for: authenticatedEmailKey)
    }
}
