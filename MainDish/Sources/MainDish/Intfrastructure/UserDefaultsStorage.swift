//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.02.2024.
//

import Foundation

struct UserDefaultsStorage: LocalStorage {
    let userDefaults: UserDefaults
    
    func fetch<T>(for key: String) -> T? {
        userDefaults.value(forKey: key) as? T
    }
    
    func store<T>(value: T?, for key: String) {
        userDefaults.set(value, forKey: key)
    }
}

