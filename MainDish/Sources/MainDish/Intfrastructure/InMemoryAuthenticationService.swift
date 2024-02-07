//
//  InMemoryAuthService.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation


public class InMemoryAuthenticationService: LoginUseCase, RegisterCustomerUseCase {
    public struct RegisteredUser: Equatable {
        public let email: String
        fileprivate let password: String
    }
    
    public var users: [RegisteredUser] = []
    public init() {}
    
    public func register(customer: Customer, password: String) async throws {
        users.append(RegisteredUser(email: customer.email, password: password))
    }
    
    public func login(email: String, password: String) async throws {
        
        let containsUserCredentials: (RegisteredUser) -> Bool = { user in
            user.email == email && user.password == password
        }
        
        if users.contains(where: containsUserCredentials) {
            return
        }
        
        throw LoginFailedException()
    }
}

public struct LoginFailedException: Error {}
