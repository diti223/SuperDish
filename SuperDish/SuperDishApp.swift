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
    @StateObject var appFlow = InMemoryAppFlowFactory.makeAppFlow()
    #else
    @StateObject var appFlow = InMemoryAppFlowFactory.makeAppFlow()
    #endif
    
    var body: some Scene {
        WindowGroup {
            AppContainerView(appFlow: appFlow)
        }
        .defaultSize(width: 300, height: 200)
    }
}
