//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 14.03.2024.
//

import Foundation

extension Dish {
    public static let spaghettiBolognese = Dish(
        name: "Spaghetti Bolognese",
        description: "A classic Italian pasta dish with a rich meat sauce.",
        ingredients: [
            Ingredient(food: .groundBeef, amount: 1.0, unit: "pound", quantity: 1.0),
            Ingredient(
                food: .onion,
                amount: 1.0,
                unit: "piece",
                quantity: 1.0
            ),
            Ingredient(
                food: .garlic,
                amount: 3.0,
                unit: "pieces",
                quantity: 3.0
            ),
            Ingredient(
                food: .tomatoSauce,
                amount: 24.0,
                unit: "ounces",
                quantity: 24.0
            ),
            Ingredient(
                food: .spaghetti,
                amount: 16.0,
                unit: "ounces",
                quantity: 16.0
            )
        ],
        instructions: [
            "Cook the spaghetti according to package instructions.",
            "In a large skillet, cook the ground beef, onion, and garlic over medium heat until beef is browned and vegetables are tender.",
            "Add the tomato sauce and simmer for 15-20 minutes.",
            "Drain the spaghetti and serve with the Bolognese sauce."
        ]
    )
}

extension Food {
    
    static let groundBeef = Food(name: "Ground beef", macroNutrients: nil)
    static let onion = Food(name: "Onion", macroNutrients: nil)
    static let garlic = Food(name: "Garlic cloves", macroNutrients: nil)
    static let tomatoSauce = Food(name: "Tomato sauce", macroNutrients: nil)
    static let spaghetti = Food(name: "Spaghetti", macroNutrients: nil)
}



