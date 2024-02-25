//
//  Customer.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

public struct Customer: Identifiable {
    public let id: UUID
    public var name: String
    public var email: String
    public var deliveryAddress: String
    
    public init(id: UUID, name: String, email: String, deliveryAddress: String) {
        self.id = id
        self.name = name
        self.email = email
        self.deliveryAddress = deliveryAddress
    }
}
