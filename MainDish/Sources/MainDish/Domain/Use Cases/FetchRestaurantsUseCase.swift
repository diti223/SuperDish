//
//  FetchRestaurantsUseCase.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

protocol FetchRestaurantsUseCase {
    func fetch() async throws -> [Restaurant]
}
