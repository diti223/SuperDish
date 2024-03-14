//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 14.03.2024.
//

import Foundation

class CookBookViewModel: ObservableObject {
    @Published var dishes: [Dish]?
    @Published var isLoading = false
    
    private let useCase: FetchDishesUseCase
    
    init(useCase: FetchDishesUseCase) {
        self.useCase = useCase
    }
    
    @MainActor
    func fetchDishes() async {
        isLoading = true
        let dishes = try! await useCase.execute()
        self.dishes = dishes
        isLoading = false
    }
}
