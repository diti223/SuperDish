//
//  Order.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

enum OrderStatus {
    case notPlaced
    case pending
    case confirmed
    case inPreparation
    case outForDelivery
    case delivered
    case cancelled
}

struct Order: Identifiable {
    let id: UUID
    var items: [OrderItem]
    var paymentDetails: PaymentDetails
    var deliveryDetails: DeliveryDetails
}
