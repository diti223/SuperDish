//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.02.2024.
//

import Foundation
import Combine

final public class HomeFlow: ObservableObject {
    var email: String
    
    init(email: String) {
        self.email = email
    }
    
    // track order items and build an order
    // Order Steps:
    // - list of restaurants
    // - list of dishes
    // - confirm order
    // - pay order
    // - track order
    // - review order
    
    
    public func start() {
        // present some kind of dashboard with items:
        // - restaurants
        // - settings/profile/account
    }
    
    // Use Cases needed:
    // - logout
    // - fetch restaurants
    // - fetch dish
    
}
