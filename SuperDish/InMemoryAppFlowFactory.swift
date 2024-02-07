//
//  InMemoryAppFlowFactory.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 07.02.2024.
//

import Foundation
import MainDish

enum InMemoryAppFlowFactory {
    @MainActor
    static func makeAppFlow() -> AppFlow {
        AppFlow(
            loginUseCase: InMemoryAuthenticationService.shared,
            registerUseCase: InMemoryAuthenticationService.shared
        )
    }
}
