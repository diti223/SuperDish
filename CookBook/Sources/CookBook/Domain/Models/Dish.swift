//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 14.03.2024.
//

import Foundation

public struct Dish: Identifiable {
    public var id: String {
        name
    }
    let name: String
    let description: String?
    let ingredients: [Ingredient]
    let instructions: [String]
}
