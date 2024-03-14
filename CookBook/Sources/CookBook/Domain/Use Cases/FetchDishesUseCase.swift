//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 14.03.2024.
//

import Foundation

public protocol FetchDishesUseCase {
    func execute() async throws -> [Dish]
}

extension UseCase<Void, [Dish]>: FetchDishesUseCase {
 
}
