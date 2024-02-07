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
        let customer = makeCustomer(email: email)
        
        // when
        try await sut.register(
            customer: customer,
            password: "any password"
        )
        
        // then
        XCTAssertEqual(sut.users[0].email, "john@doe.com")
    }
    
    func testOnLogin_MissingUser_ThrowsLoginFailedException() async throws {
        let sut = makeSUT()
        
        await XCTAssertThrowsAsyncError(
            try await sut.login(email: "any email", password: "whatever"),
            LoginFailedException.self
        )
    }
    
    func testOnLogin_ExistingUsers_InvalidPassword_ThrowLoginFailedException() async throws {
        // given
        let sut = makeSUT()
        
        let email = "john@doe.com"
        let password = "someStrongPasswordHere"
        let customer = makeCustomer(email: email)
        try await sut.register(customer: customer, password: password)
        
        // when
        await XCTAssertThrowsAsyncError(
            try await sut.login(email: email, password: "invalid passowrd"),
            LoginFailedException.self,
            "Expected no error for valid login credentials"
        )
    }
    
    func testOnLogin_ExistingUsers_ValidCredentials_ThrowsNoError() async throws {
        // given
        let sut = makeSUT()
        
        let email = "john@doe.com"
        let password = "someStrongPasswordHere"
        let customer = makeCustomer(email: email)
        try await sut.register(customer: customer, password: password)
        
        // when
        await XCTAssertNoThrowAsync(
            try await sut.login(email: email, password: password),
            "Expected no error for valid login credentials"
        )
    }
    
    private func makeCustomer(email: String) -> Customer {
        Customer(
            id: UUID(),
            name: "any name",
            email: email,
            deliveryAddress: "any address"
        )
    }
    
    //TODO:
    // invalid email, invalid password
    // valid email, invalid password
    // invalid email, valid password
    // valid email, valid password
    // register user with existing email should throw exception
    
    //MARK: -
    private func makeSUT() -> InMemoryAuthenticationService {
        InMemoryAuthenticationService()
    }
}
