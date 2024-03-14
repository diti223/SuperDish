//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 14.03.2024.
//

import SwiftUI


public struct CookBookView: View {
    @ObservedObject private var viewModel: CookBookViewModel
    
    public init(useCase: FetchDishesUseCase) {
        self.viewModel = CookBookViewModel(useCase: useCase)
    }
    
    public var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let dishes = viewModel.dishes {
                List(dishes) { dish in
                    DishCellView(dish: dish)
                }
            } else {
                ContentUnavailableView(
                    title: "No Dishes Found",
                    image: "dish-unavailable"
                )
            }
        }
        .task {
            await viewModel.fetchDishes()
        }
    }
}

struct DishDetailView: View {
    let dish: Dish
    var body: some View {
        Text("Detail \(dish.name)")
    }
}

struct DishCellView: View {
    let dish: Dish
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dish.name)
                    .font(.headline)
                Text(dish.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
//            if let image = dish.image {
//                Image(uiImage: image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 50, height: 50)
//            }
        }
    }
}

struct ContentUnavailableView: View {
    let title: String
    let image: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundColor(.gray)
            Text(title)
                .font(.title)
                .foregroundColor(.gray)
        }
    }
}
