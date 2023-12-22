//
//  id.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

struct MenuItem {
    let id: UUID
    var name: String
    var description: String
    var price: Double
    var category: String
    var imageUrl: URL?
}
