//
//  Order.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

enum OrderStatus {
    case pending
    case confirmed
    case inPreparation
    case outForDelivery
    case delivered
    case cancelled
}

struct Order {
    let id: UUID
    let customerId: UUID
    var items: [OrderItem]
    var paymentDetails: PaymentDetails
    var deliveryDetails: DeliveryDetails
    var status: OrderStatus
}
