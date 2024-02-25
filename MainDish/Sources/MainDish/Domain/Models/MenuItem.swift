//
//  id.swift
//  SuperDish
//
//  Created by Adrian Bilescu on 10.12.2023.
//

import Foundation

struct Price {
    let currency: Locale.Currency
    let value: Double
    
    init(currency: Locale.Currency, value: Double) {
        self.currency = currency
        self.value = value
    }
}

struct MenuItem: Identifiable {
    let id: UUID
    var name: String
    var description: String
    var price: Price
    var category: String
    var imageURL: URL?
}


extension MenuItem {
    
    static let dummyJSON: Data = {
"""
[
  {
    "id": "1E2D3C4B-5A6B-7C8D-9E0F-1A2B3C4D5E6F",
    "name": "Classic Burger",
    "description": "Juicy beef patty with lettuce, tomato, and our special sauce.",
    "price": 9.99,
    "category": "Main Course",
    "imageUrl": null
  },
  {
    "id": "2F3E4D5C-6A7B-8C9D-0E1F-2A3B4C5D6E7F",
    "name": "Veggie Pizza",
    "description": "Loaded with bell peppers, olives, onions, and tomatoes.",
    "price": 12.99,
    "category": "Main Course",
    "imageUrl": null
  },
  {
    "id": "3G4H5I6J-7K8L-9M0N-1O2P-3Q4R5S6T7U8V",
    "name": "Caesar Salad",
    "description": "Crisp romaine lettuce with Caesar dressing and croutons.",
    "price": 7.99,
    "category": "Salads",
    "imageUrl": null
  },
  {
    "id": "4I5J6K7L-8M9N-0O1P-2Q3R-4S5T6U7V8W9X",
    "name": "Spaghetti Carbonara",
    "description": "Creamy pasta with pancetta, cheese, and a touch of pepper.",
    "price": 11.99,
    "category": "Main Course",
    "imageUrl": null
  },
  {
    "id": "5K6L7M8N-9O0P-1Q2R-3S4T-5U6V7W8X9Y0Z",
    "name": "Mango Smoothie",
    "description": "Fresh mangoes blended with ice and a hint of honey.",
    "price": 5.99,
    "category": "Beverages",
    "imageUrl": null
  },
  {
    "id": "6L7M8N9O-0P1Q-2R3S-4T5U-6V7W8X9Y0Z1A",
    "name": "BBQ Ribs",
    "description": "Tender ribs smothered in our signature BBQ sauce.",
    "price": 15.99,
    "category": "Main Course",
    "imageUrl": null
  },
  {
    "id": "7M8N9O0P-1Q2R-3S4T-5U6V-7W8X9Y0Z1A2B",
    "name": "Chicken Wings",
    "description": "Spicy and savory wings, served with blue cheese dip.",
    "price": 8.99,
    "category": "Appetizers",
    "imageUrl": null
  },
  {
    "id": "8N9O0P1Q-2R3S-4T5U-6V7W-8X9Y0Z1A2B3C",
    "name": "Chocolate Cake",
    "description": "Rich and moist chocolate cake with chocolate ganache.",
    "price": 6.99,
    "category": "Desserts",
    "imageUrl": null
  },
  {
    "id": "9O0P1Q2R-3S4T-5U6V-7W8X-9Y0Z1A2B3C4D",
    "name": "Fish Tacos",
    "description": "Grilled fish with cabbage slaw and a squeeze of lime.",
    "price": 10.99,
    "category": "Main Course",
    "imageUrl": null
  },
  {
    "id": "0P1Q2R3S-4T5U-6V7W-8X9Y-0Z1A2B3C4D5E",
    "name": "Lemonade",
    "description": "Freshly squeezed lemonade with a hint of mint.",
    "price": 3.99,
    "category": "Beverages",
    "imageUrl": null
  },
  {
    "id": "1Q2R3S4T-5U6V-7W8X-9Y0Z-1A2B3C4D5E6F",
    "name": "Quinoa Salad",
    "description": "Healthy quinoa salad with avocado, tomatoes, and cucumbers.",
    "price": 9.99,
    "category": "Salads",
    "imageUrl": null
  },
  {
    "id": "2R3S4T5U-6V7W-8X9Y-0Z1A-2B3C4D5E6F7G",
    "name": "Beef Stew",
    "description": "Hearty beef stew with potatoes, carrots, and peas.",
    "price": 13.99,
    "category": "Main Course",
    "imageUrl": null
  },
  {
    "id": "3S4T5U6V-7W8X-9Y0Z-1A2B-3C4D5E6F7G8H",
    "name": "Greek Yogurt",
    "description": "Thick and creamy Greek yogurt with honey and walnuts.",
    "price": 4.99,
    "category": "Desserts",
    "imageUrl": null
  },
  {
    "id": "4T5U6V7W-8X9Y-0Z1A-2B3C-4D5E6F7G8H9I",
    "name": "Grilled Salmon",
    "description": "Perfectly grilled salmon with a lemon butter sauce.",
    "price": 17.99,
    "category": "Main Course",
    "imageUrl": null
  },
  {
    "id": "5U6V7W8X-9Y0Z-1A2B-3C4D-5E6F7G8H9I0J",
    "name": "Iced Coffee",
    "description": "Cold brew coffee served over ice with a splash of milk.",
    "price": 4.99,
    "category": "Beverages",
    "imageUrl": null
  },
  {
    "id": "6V7W8X9Y-0Z1A-2B3C-4D5E-6F7G8H9I0J1K",
    "name": "Tiramisu",
    "description": "Classic Italian dessert with layers of coffee-soaked ladyfingers and mascarpone.",
    "price": 7.99,
    "category": "Desserts",
    "imageUrl": null
  },
  {
    "id": "7W8X9Y0Z-1A2B-3C4D-5E6F-7G8H9I0J1K2L",
    "name": "Nachos",
    "description": "Crispy nachos topped with jalapeños, cheese, and salsa.",
    "price": 6.99,
    "category": "Appetizers",
    "imageUrl": null
  },
  {
    "id": "8X9Y0Z1A-2B3C-4D5E-6F7G-8H9I0J1K2L3M",
    "name": "French Fries",
    "description": "Crispy golden fries served with a side of ketchup.",
    "price": 4.99,
    "category": "Sides",
    "imageUrl": null
  },
  {
    "id": "9Y0Z1A2B-3C4D-5E6F-7G8H-9I0J1K2L3M4N",
    "name": "Mushroom Risotto",
    "description": "Creamy risotto with wild mushrooms and Parmesan cheese.",
    "price": 14.99,
    "category": "Main Course",
    "imageUrl": null
  },
  {
    "id": "0Z1A2B3C-4D5E-6F7G-8H9I-0J1K2L3M4N5O",
    "name": "Apple Pie",
    "description": "Warm apple pie with a flaky crust and a scoop of vanilla ice cream.",
    "price": 5.99,
    "category": "Desserts",
    "imageUrl": null
  },
  {
    "id": "1A2B3C4D-5E6F-7G8H-9I0J-1K2L3M4N5O6P",
    "name": "Cobb Salad",
    "description": "Classic Cobb salad with chicken, bacon, avocado, and blue cheese.",
    "price": 10.99,
    "category": "Salads",
    "imageUrl": null
  },
  {
    "id": "2B3C4D5E-6F7G-8H9I-0J1K-2L3M4N5O6P7Q",
    "name": "Espresso",
    "description": "Strong and rich espresso, freshly brewed.",
    "price": 2.99,
    "category": "Beverages",
    "imageUrl": null
  },
  {
    "id": "3C4D5E6F-7G8H-9I0J-1K2L-3M4N5O6P7Q8R",
    "name": "Bruschetta",
    "description": "Toasted bread with fresh tomatoes, basil, and garlic.",
    "price": 5.99,
    "category": "Appetizers",
    "imageUrl": null
  },
  {
    "id": "4D5E6F7G-8H9I-0J1K-2L3M-4N5O6P7Q8R9S",
    "name": "Mocha Latte",
    "description": "Rich espresso with chocolate, steamed milk, and a hint of whipped cream.",
    "price": 4.99,
    "category": "Beverages",
    "imageUrl": null
  }
]
""".data(using: .utf8)!
    }()
}
