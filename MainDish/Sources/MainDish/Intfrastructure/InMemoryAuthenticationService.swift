//
//  InMemoryAuthService.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation


public class InMemoryAuthenticationService {
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

//public class InMemoryAuthenticationService: LoginUseCase, RegisterCustomerUseCase {
//    public static let shared = InMemoryAuthenticationService()
//    
//    struct RegisteredUser {
//        let email: String
//        let password: String
//    }
//    
//    struct InvalidCredentials: Error {}
//    
//    var users: [RegisteredUser] = []
//    
//    public func login(email: String, password: String) async throws {
//        guard (users.first(where: { $0.email == email })?.password == password) else {
//            throw InvalidCredentials()
//        }
//    }
//    
//    public func register(customer: Customer, password: String) async throws {
//        users.append(RegisteredUser(email: customer.email, password: password))
//    }
//}
//
//
//
