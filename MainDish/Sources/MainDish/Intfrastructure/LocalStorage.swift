//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.02.2024.
//

import Foundation

public protocol LocalStorage {
    func store<T>(value: T?, for key: String)
    func fetch<T>(for key: String) -> T?
}

extension LocalStorage {
    subscript<T>(_ key: String) -> T? {
        fetch(for: key)
    }
}
