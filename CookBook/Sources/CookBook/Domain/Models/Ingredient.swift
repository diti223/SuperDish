//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 14.03.2024.
//

import Foundation

typealias Gram = Int

struct MacroNutrients {
    let caloriesPerHundredGram: Int
    let proteinPerHundredGram: Gram
    let carbsPerHundredGram: Gram
    let fatPerHundredGram: Gram
}

struct Ingredient {
    let food: Food
    let amount: Double
    let unit: String
    let quantity: Double
}

struct Food {
    let name: String
    let macroNutrients: MacroNutrients?
}
