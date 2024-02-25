//
//  AppContainerView.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 25.02.2024.
//

import Foundation
import SwiftUI

public struct AppContainerView: View {
    @ObservedObject var appFlow: AppFlow
    @Environment(\.scenePhase) var scenePhase
    
    public init(appFlow: AppFlow) {
        self.appFlow = appFlow
    }
    
    public var body: some View {
        Group {
            if let viewModel = appFlow.loginViewModel {
                LoginView(viewModel: viewModel)
            } else {
                Color.clear
                    .onAppear(perform: {
                        appFlow.start()
                    })
            }
        }
        .onChange(of: scenePhase) { (oldPhase, newPhase) in
            if case .active = newPhase {
                appFlow.start()
            }
        }
    }
    
}
