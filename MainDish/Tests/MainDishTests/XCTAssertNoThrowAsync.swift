//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 07.02.2024.
//

import Foundation
import XCTest

extension XCTestCase {
    func XCTAssertNoThrowAsync(
        _ expression: @autoclosure @escaping () async throws -> Void,
        _ message: String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) async {
        do {
            try await expression()
        } catch {
            XCTFail("Didn't expect to throw an error. Got `\(error)`. \(message)", file: file, line: line)
        }
    }
}
