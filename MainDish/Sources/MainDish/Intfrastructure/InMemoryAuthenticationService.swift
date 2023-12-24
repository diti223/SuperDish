//
//  InMemoryAuthService.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

class InMemoryAuthenticationService: LoginUseCase, RegisterCustomerUseCase {
    static let shared = InMemoryAuthenticationService()
    
    struct RegisteredUser {
        let email: String
        let password: String
    }
    
    struct InvalidCredentials: Error {}
    
    var users: [RegisteredUser] = []
    func login(email: String, password: String) async throws {
        guard (users.first(where: { $0.email == email })?.password == password) else {
            throw InvalidCredentials()
        }
    }
    
    func register(customer: Customer, password: String) async throws {
        users.append(RegisteredUser(email: customer.email, password: password))
    }
}
