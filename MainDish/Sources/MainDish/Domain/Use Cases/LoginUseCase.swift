//
//  LoginUseCase.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

public protocol LoginUseCase {
    func login(email: String, password: String) async throws
}


public struct LoginRequest {
    public let email: String
    public let password: String
}

extension UseCase<LoginRequest, Void>: LoginUseCase {
    public func login(email: String, password: String) async throws {
        try await execute(
            LoginRequest(email: email, password: password)
        )
    }
}

public struct InvalidCredentialsException: Error {
    public init() {}
}
