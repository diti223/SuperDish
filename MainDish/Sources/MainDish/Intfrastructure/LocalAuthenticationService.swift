//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.02.2024.
//

import Foundation

public protocol LocalStorage {
    func store<T>(value: T?, for key: String)
    func fetch<T>(for key: String) -> T?
}

extension LocalStorage {
    subscript<T>(_ key: String) -> T? {
        fetch(for: key)
    }
}

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
