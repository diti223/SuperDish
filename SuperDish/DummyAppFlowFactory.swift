//
//  DummyAppFlowFactory.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 07.02.2024.
//

import Foundation
import MainDish

enum DummyAppFlowFactory {
    @MainActor
    static func makeAppFlow() -> AppFlow {
        AppFlow(
            loginUseCase: UseCase { request in
                debugPrint("Received login request \(request)")
            }, registerUseCase: UseCase { request in
                debugPrint("Received register request \(request)")
            })
    }
}

