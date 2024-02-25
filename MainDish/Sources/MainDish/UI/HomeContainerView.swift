//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.02.2024.
//

import Foundation
import SwiftUI

struct HomeContainerView: View {
    @ObservedObject var homeFlow: HomeFlow
    
    var body: some View {
        TabView {
            // restaurants
            OrderContainerView()
                .tabItem { Image(systemName: "fork.knife") }
            // account
            
        }
    }
}

struct OrderContainerView: View {
    
    var body: some View {
        // launch restaurants view
        RestaurantsView()
        
        // launch account view
    }
}

struct RestaurantsView: View {
    // add the view model
    let restaurants = [
        Restaurant(
            id: UUID(),
            name: "Rest 1",
            address: "Address 1"
        ),
        Restaurant(
            id: UUID(),
            name: "Rest 2",
            address: "Address 2"
        ),
        Restaurant(
            id: UUID(),
            name: "Rest 3",
            address: "Address 3"
        )
    ]
    
    var body: some View {
        List {
            ForEach(restaurants) {
                Text($0.name + " " + $0.address)
            }
        }
    }
}
