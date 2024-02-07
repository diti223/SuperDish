//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 07.02.2024.
//

import Foundation
import XCTest
import MainDish

class InMemoryAuthenticationServiceTests: XCTestCase {
    func testOnInit_ListIsEmpty() {
        let sut = InMemoryAuthenticationService()
        XCTAssertEqual(sut.users, [])
    }
    
    func testOnRegister_AddUserToList() async throws {
        let sut = InMemoryAuthenticationService()
        
        let email = "john@doe.com"
        try await sut.register(
            customer: Customer(
                id: UUID(),
                name: "any name",
                email: email,
                deliveryAddress: "any address"
            ),
            password: "any password"
        )
        
        XCTAssertEqual(sut.users[0].email, "john@doe.com")
    }
}
