//
//  Restaurant.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

struct Restaurant {
    typealias ID = UUID
    let id: ID
    var name: String
    var address: String
    var menuItems: [MenuItem]
}
