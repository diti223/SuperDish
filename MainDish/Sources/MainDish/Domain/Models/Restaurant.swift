//
//  Restaurant.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

struct Restaurant: Identifiable, Decodable {
    let id: UUID
    var name: String
    var address: String
}

extension Restaurant {
    static let dummyJSON: Data = {
"""
[
  {
    "id": "A1B2C3D4-E5F6-G7H8-I9J0-K1L2M3N4O5P6",
    "name": "Ocean View Cafe",
    "address": "123 Seaside Blvd, Beachtown"
  },
  {
    "id": "B2C3D4E5-F6G7-H8I9-J0K1-L2M3N4O5P6Q7",
    "name": "Mountain Peak Bistro",
    "address": "456 Alpine Rd, Highland"
  },
  {
    "id": "C3D4E5F6-G7H8-I9J0-K1L2-M3N4O5P6Q7R8",
    "name": "Urban Eats",
    "address": "789 Downtown Ave, Metro City"
  },
  {
    "id": "D4E5F6G7-H8I9-J0K1-L2M3-N4O5P6Q7R8S9",
    "name": "Garden Fresh",
    "address": "101 Greenway St, Springfield"
  },
  {
    "id": "E5F6G7H8-I9J0-K1L2-M3N4-O5P6Q7R8S9T0",
    "name": "Riverside Grill",
    "address": "202 River Rd, Waterside"
  },
  {
    "id": "F6G7H8I9-J0K1-L2M3-N4O5-P6Q7R8S9T0U1",
    "name": "Skyline Rooftop",
    "address": "303 High St, Skylight City"
  }
]
""".data(using: .utf8)!
    }()
}
