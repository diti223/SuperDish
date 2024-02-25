//
//  PlaceOrderUseCase.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

protocol PlaceOrderUseCase {
    func place(order: Order, payment: PaymentDetails) async throws
}
