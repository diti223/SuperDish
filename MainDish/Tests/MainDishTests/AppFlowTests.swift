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
class AppFlowTests: XCTestCase {
    func testInit() {
        let sut = makeSUT()
        XCTAssertNil(sut.loginViewModel)
    }
    
    func testOnStart() {
        let sut = makeSUT()
        
        sut.start()
        
        XCTAssertNotNil(sut.loginViewModel)
    }
    
    private func makeSUT() -> AppFlow {
        AppFlow(loginUseCase: UseCaseSender.makeEmpty(), registerUseCase: UseCaseSender.makeEmpty())
    }
}
