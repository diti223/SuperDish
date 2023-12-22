//
//  SuperDishTests.swift
//  SuperDishTests
//
//  Created by Adrian Bilescu on 18.08.2023.
//

import XCTest
import MainDish

@MainActor
final class LoginViewModelTests: XCTestCase {
    
    func testLoginSelected_ThrowingInvalidCredentials_DisplaysErrorMessage() async throws {
        
        let sut = LoginViewModel(
            loginUseCase: UseCaseSender { _ in
                throw InvalidCredentialsException()
            },
            registerUseCase: UseCaseSender { _ in}
        )
        
        await sut.loginSelected()
        
        XCTAssertEqual(sut.errorMessage, "Invalid credentials")
    }
}


