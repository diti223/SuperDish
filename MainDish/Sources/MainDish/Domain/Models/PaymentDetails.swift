//
//  PaymentDetails.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

struct PaymentDetails {
    var method: PaymentMethod
    var cardNumber: String
    var expiryDate: Date
    var cvv: String
}

enum PaymentMethod {
    case creditCard
    case paypal
    case applePay
}


