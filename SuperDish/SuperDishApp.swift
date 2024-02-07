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

    #if DEBUG
    @StateObject var appFlow = DummyAppFlowFactory.makeAppFlow()
    #else
    @StateObject var appFlow = InMemoryAppFlowFactory.makeAppFlow()
    #endif
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            if let viewModel = appFlow.loginViewModel {
                LoginView(viewModel: viewModel)
            }
        }
        .onChange(of: scenePhase) { (oldPhase, newPhase) in
            if case .active = newPhase {
                appFlow.start()
            }
        }
    }
}



