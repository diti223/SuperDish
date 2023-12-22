//
//  RegisterCustomerUseCase.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

public protocol RegisterCustomerUseCase {
    func register(customer: Customer, password: String) async throws
}


public struct RegisterRequest {
    public let customer: Customer
    public let password: String
}

extension UseCase: RegisterCustomerUseCase where Input == RegisterRequest, Output == Void {
    public func register(customer: Customer, password: String) async throws {
        try await execute(RegisterRequest(customer: customer, password: password))
    }
}
