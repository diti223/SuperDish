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
        let sut = makeSUT()
        XCTAssertEqual(sut.users, [])
    }
    
    func testOnRegister_AddUserToList() async throws {
        // given
        let sut = makeSUT()
        
        let email = "john@doe.com"
        let customer = Customer(
            id: UUID(),
            name: "any name",
            email: email,
            deliveryAddress: "any address"
        )
        
        // when
        try await sut.register(
            customer: customer,
            password: "any password"
        )
        
        // then
        XCTAssertEqual(sut.users[0].email, "john@doe.com")
    }
    
    func testOnLogin_MissingUser_ThrowsInvalidUserException() async throws {
        let sut = makeSUT()
        
        await XCTAssertThrowsAsyncError(
            try await sut.login(email: "any email", password: "whatever"),
            InvalidUserException.self
        )
    }
    
    func makeSUT() -> InMemoryAuthenticationService {
        InMemoryAuthenticationService()
    }
}
