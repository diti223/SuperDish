//
//  OrderItem.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

struct OrderItem {
    let menuItemId: UUID
    var quantity: Int
    var specialInstructions: String?
}
