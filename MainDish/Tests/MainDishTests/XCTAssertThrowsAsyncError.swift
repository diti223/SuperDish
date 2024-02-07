//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 07.02.2024.
//

import Foundation
import XCTest

extension XCTestCase {
    func XCTAssertThrowsAsyncError<T: Error>(
        _ expression: @autoclosure @escaping () async throws -> Void,
        _ expectedErrorType: T.Type,
        _ message: String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) async {
        do {
            try await expression()
            XCTFail("Expected to throw an error of type \(expectedErrorType), but got success. \(message)", file: file, line: line)
        } catch {
            XCTAssert(error is T, "Expected to throw an error of type \(expectedErrorType), but got \(error). \(message)", file: file, line: line)
        }
    }
}
