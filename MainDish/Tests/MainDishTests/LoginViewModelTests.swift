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
    
    // MARK: - Test Initial State
    func testInitialState() {
        let sut = makeSUT()
        XCTAssertNil(sut.errorMessage)
        XCTAssertEqual(sut.email, "")
        XCTAssertEqual(sut.password, "")
    }
    
    // MARK: - Test Login Use Case
    func testLoginSelected_ThrowingInvalidCredentials_DisplaysErrorMessage() async throws {
        
        let sut = makeValidSUT(loginUseCase: UseCaseSender { _ in
            throw InvalidCredentialsException()
        })
        
        await sut.loginSelected()
        
        XCTAssertEqual(sut.errorMessage, "Invalid credentials")
    }
    
    func testLoginSelected_EmptyFields_DisplaysEmptyFieldErrorMessage() async {
        let sut = makeSUT()
        
        await sut.loginSelected()
        
        XCTAssertEqual(sut.errorMessage, "Fields are empty")
    }
    
    func testLoginSelected_ValidFields_InvokesLoginUseCase() async {
        var invokedLoginCount = 0
        let sut = makeValidSUT(loginUseCase: UseCaseSender { _ in
            invokedLoginCount += 1
        })
        
        await sut.loginSelected()
        
        XCTAssertEqual(invokedLoginCount, 1)
    }
    
    func testLoginSelected_SuccessResponse_PublishesFinishEvent() async {
        let sut = makeValidSUT()
        
        await sut.loginSelected()
        
        XCTAssertEqual(sut.hasFinishedLogin, true, "Expected to finish login")
    }
    
    // MARK: - Test Register Use Case
    func testRegisterSelected_ThrowingInvalidCredentials_DisplaysErrorMessage() async throws {
        
        let sut = makeValidSUT(registerUseCase: UseCaseSender { _ in
            throw InvalidCredentialsException()
        })
        
        await sut.register()
        
        XCTAssertEqual(sut.errorMessage, "Invalid credentials")
    }
    
    func testRegisterSelected_EmptyFields_DisplaysEmptyFieldErrorMessage() async {
        let sut = makeSUT()
        
        await sut.register()
        
        XCTAssertEqual(sut.errorMessage, "Fields are empty")
    }
    
    func testRegisterSelected_ValidFields_InvokesLoginUseCase() async {
        var invokedRegisterCount = 0
        let sut = makeValidSUT(registerUseCase: UseCaseSender { _ in
            invokedRegisterCount += 1
        })
        
        await sut.register()
        
        XCTAssertEqual(invokedRegisterCount, 1)
    }
    
    func testRegisterSelected_SuccessResponse_PublishesFinishEvent() async {
        let sut = makeValidSUT()
        
        await sut.register()
        
        XCTAssertEqual(sut.hasFinishedRegister, true, "Expected to finish login")
    }
    
    // MARK: - Helpers
    
    private func makeSUT(loginUseCase: LoginUseCase = UseCaseSender { _ in }, registerUseCase: RegisterCustomerUseCase = UseCaseSender { _ in }) -> LoginViewModel {
        let sut = LoginViewModel(
            loginUseCase: loginUseCase,
            registerUseCase: registerUseCase
        )
        
        return sut
    }
    
    private func makeValidSUT(loginUseCase: LoginUseCase = UseCaseSender { _ in }, registerUseCase: RegisterCustomerUseCase = UseCaseSender { _ in }) -> LoginViewModel {
        let sut = makeSUT(loginUseCase: loginUseCase, registerUseCase: registerUseCase)
        fillInValidCredentials(sut)
        
        return sut
    }
    
    
    private func fillInValidCredentials(_ sut: LoginViewModel) {
        sut.email = "someEmail"
        sut.password = "somePass"
    }
    
}


