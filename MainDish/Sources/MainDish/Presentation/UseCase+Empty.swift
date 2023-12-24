//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 24.12.2023.
//

import Foundation

extension UseCaseSender {
    public static func makeEmpty() -> UseCaseSender<Input> {
        UseCaseSender { _ in }
    }
}
