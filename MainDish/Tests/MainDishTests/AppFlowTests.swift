//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 24.12.2023.
//

import Foundation
import XCTest
import MainDish

@MainActor
class AppFlow {
    var loginViewModel: LoginViewModel?
    
    func start() {
        loginViewModel = LoginViewModel(loginUseCase: UseCaseSender.makeEmpty(), registerUseCase: UseCaseSender.makeEmpty())
    }
}

extension UseCaseSender {
    static func makeEmpty() -> UseCaseSender<Input> {
        UseCaseSender { input in
            
        }
    }
}

@MainActor
class AppFlowTests: XCTestCase {
    func testInit() {
        let sut = AppFlow()
        XCTAssertNil(sut.loginViewModel)
    }
    
    func testOnStart() {
        let sut = AppFlow()
        
        sut.start()
        
        XCTAssertNotNil(sut.loginViewModel)
    }
}
