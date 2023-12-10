//
//  SuperDishApp.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 17.08.2023.
//

import SwiftUI

@main
struct SuperDishApp: App {
    let inMemoryService = InMemoryAuthenticationService()
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel(loginUseCase: inMemoryService, registerUseCase: inMemoryService))
        }
    }
}
