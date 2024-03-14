//
//  SuperDishApp.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 17.08.2023.
//

import SwiftUI
import CookBook

@main
struct SuperDishApp: App {
    
    var body: some Scene {
        WindowGroup {
            CookBookView(useCase: UseCase {
                [
                    Dish.spaghettiBolognese
                ]
            })
        }
    }
}
