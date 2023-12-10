//
//  RegisterCustomerUseCase.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

public protocol RegisterCustomerUseCase {
    func register(customer: Customer, password: String) async throws
}

