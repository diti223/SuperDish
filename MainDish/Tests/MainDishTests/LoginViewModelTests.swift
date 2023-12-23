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
        
        let sut = makeSUT(loginUseCase: UseCaseSender { _ in
            throw InvalidCredentialsException()
        })
        fillInValidCredentials(sut)
        
        await sut.loginSelected()
        
        XCTAssertEqual(sut.errorMessage, "Invalid credentials")
    }
    
    func testLoginSelected_EmptyFields_DisplaysEmptyFieldErrorMessage() async {
        let sut = makeSUT()
        
        await sut.loginSelected()
        
        XCTAssertEqual(sut.errorMessage, "Fields are empty")
    }
    
    func testLoginSelected_SuccessResponse_PublishesFinishEvent() async {
        let sut = makeSUT()
        fillInValidCredentials(sut)
        
        await sut.loginSelected()
        
        XCTAssertEqual(sut.hasFinishedLogin, true, "Expected to finish login")
    }
    
    private func makeSUT(loginUseCase: LoginUseCase = UseCaseSender { _ in }, registerUseCase: RegisterCustomerUseCase = UseCaseSender { _ in }) -> LoginViewModel {
        let sut = LoginViewModel(
            loginUseCase: loginUseCase,
            registerUseCase: registerUseCase
        )
        
        return sut
    }
    
    private func fillInValidCredentials(_ sut: LoginViewModel) {
        sut.email = "someEmail"
        sut.password = "somePass"
    }
    
}


