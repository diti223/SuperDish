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

extension UseCaseFetcher<[Restaurant]>: FetchRestaurantsUseCase {
    func fetch() async throws -> [Restaurant] {
        try await execute()
    }
}
