//
//  LoginUseCase.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

public protocol LoginUseCase {
    func login(email: String, password: String) async throws
}
