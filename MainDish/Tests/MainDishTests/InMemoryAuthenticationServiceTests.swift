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
    func testInit() async throws {
        let sut = InMemoryAuthenticationService()
        XCTAssertEqual(sut.users, [])
    }
}
