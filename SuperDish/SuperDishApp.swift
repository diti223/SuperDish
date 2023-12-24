//
//  SuperDishApp.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 17.08.2023.
//

import SwiftUI
import MainDish

@main
struct SuperDishApp: App {

    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
//            if let loginViewModel = appFlow.loginViewModel {
//                LoginView(viewModel: loginViewModel)
//            }
            
        }
        .onChange(of: scenePhase) { (oldPhase, newPhase) in
            
//            let appFlow = AppFlow(loginUseCase: InMemoryAuthenticationService.shared, registerUseCase: InMemoryAuthenticationService.shared)
//            if case .active = newPhase {
//                appFlow.start()
//            }
        }
    }
}


