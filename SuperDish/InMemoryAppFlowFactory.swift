//
//  InMemoryAppFlowFactory.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 07.02.2024.
//

import Foundation
import MainDish

enum InMemoryAppFlowFactory {
    static let inMemoryService = InMemoryAuthenticationService()
    @MainActor
    static func makeAppFlow() -> AppFlow {
        AppFlow(
            loginUseCase: inMemoryService,
            registerUseCase: inMemoryService
        )
    }
}
