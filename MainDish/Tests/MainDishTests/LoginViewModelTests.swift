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
            registerUseCase: UseCaseSender { _ in }
        )
        sut.email = "someEmail"
        sut.password = "somePass"
        
        await sut.loginSelected()
        
        XCTAssertEqual(sut.errorMessage, "Invalid credentials")
    }
    
    func testLoginSelected_EmptyFields_DisplaysEmptyFieldErrorMessage() async {
        let sut = LoginViewModel(
            loginUseCase: UseCaseSender { _ in },
            registerUseCase: UseCaseSender { _ in }
        )
        
        await sut.loginSelected()
        
        XCTAssertEqual(sut.errorMessage, "Fields are empty")
    }
    
    func testLoginSelected_SuccessResponse_PublishesFinishEvent() async {
        let sut = LoginViewModel(
            loginUseCase: UseCaseSender { _ in },
            registerUseCase: UseCaseSender { _ in }
        )
        sut.email = "someEmail"
        sut.password = "somePass"
        
        await sut.loginSelected()
        
        XCTAssertEqual(sut.hasFinishedLogin, true, "Expected to finish login")
    }
}


