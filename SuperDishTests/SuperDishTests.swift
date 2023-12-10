//
//  SuperDishTests.swift
//  SuperDishTests
//
//  Created by Adrian Bilescu on 18.08.2023.
//

import XCTest
import SuperDish

final class SuperDishTests: XCTestCase {
    
    func testDecodingCustomer() throws {
        
        let controller = TestPersistenceController()
        let context = controller.container.viewContext
        
        let id = UUID()
        let name = "John"
        let date = Date()
        
        let dishID = UUID()
        let dishName = "Pizza"
        let price = 1.99
        let dishDescription = "Fresh with basilicum"
                
        let dishes = [
            Dish.dummy(id: dishID, name: dishName, price: price, dishDescription: dishDescription)
        ]
        
        let object = context.makeCustomer(id: id, name: name, date: date, dishes: [context.makeDish(id: dishID, name: dishName, price: price, dishDescription: dishDescription)])
//        let object = context.makeCustomer(id: id, name: name, date: date, dishes: dishes)
        
        let decoder = makeSUT(managedObject: object)
        
        let customer = try decoder.decode(Customer.self)
        
        XCTAssertEqual(customer.id, id)
        XCTAssertEqual(customer.name, name)
        XCTAssertEqual(customer.date, date)
        XCTAssertEqual(customer.favoriteDishes, dishes)
        
    }
    
    func testDecodingDish() throws {
        
        let controller = TestPersistenceController()
        let context = controller.container.viewContext
        
        let id = UUID()
        let name = "Pizza"
        let price = 7.99
        let object = context.makeDish(id: id, name: name, price: price)
        
        let decoder = makeSUT(managedObject: object)
        
        let dish = try decoder.decode(Dish.self)
        
        XCTAssertEqual(dish.id, id)
        XCTAssertEqual(dish.name, name)
        XCTAssertEqual(dish.price, price)
        
    }
    
    private func makeSUT(managedObject: NSManagedObject) -> ManagedObjectDecoder {
        let controller = TestPersistenceController()
        let model = controller.container.managedObjectModel
        let sut = ManagedObjectDecoder(managedObject: managedObject, model: model)
        
        return sut
    }

    
    func testEncoding() throws {
        let controller = TestPersistenceController()
        let context = controller.container.viewContext
        
        let id = UUID()
        let name = "Pizza"
        let price = 7.99
        
        let dish = Dish.dummy(id: id, name: name, price: price, dishDescription: "Hello")
        
        
        let object = NSEntityDescription.insertNewObject(forEntityName: "Dish", into: context)
        let encoder = ManagedObjectEncoder(managedObject: object)
        let result = try encoder.encode(dish)
                
        XCTAssertEqual(result, object)
        XCTAssertEqual(result.value(forKey: "id") as? UUID, id)
        XCTAssertEqual(result.value(forKey: "name") as? String, name)
        XCTAssertEqual(result.value(forKey: "price") as? Double, price)
        XCTAssertEqual(result.value(forKey: "dishDescription") as? String, "Hello")
        
        
        let object2 = NSEntityDescription.insertNewObject(forEntityName: "Dish", into: context)
        let result2 = try ManagedObjectEncoder(managedObject: object2).encode(
            Dish(id: id, name: name, price: price, dishDescription: nil)
        )
        
        XCTAssertEqual(result2.value(forKey: "dishDescription") as? String, nil)
    }
    
    
//    func testEncodingCustomerWithOneDish() throws {
//        let customer = StorageCustomer.dummy()
//        let dish = Dish.dummy()
//    }
}



struct TestPersistenceController {
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TestSuperDish", managedObjectModel: NSPersistentContainer(name: "SuperDish").managedObjectModel)
//        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Handle the error appropriately for testing.
                // You might want to fail the test rather than crash the app.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

extension Customer {
    static func dummy(id: UUID = UUID(), name: String = "John", date: Date = Date()) -> Customer {
        return Customer(id: id, name: name, date: date)
    }
}

extension Dish {
    static func dummy(id: UUID = UUID(), name: String = "Pizza", price: Double = 7.99, dishDescription: String = "Delicious") -> Dish {
        return Dish(id: id, name: name, price: price, dishDescription: dishDescription)
    }
}


extension NSManagedObjectContext {
    func makeCustomer(id: UUID = UUID(), name: String = "John", date: Date = Date(), dishes: [NSManagedObject] = []) -> NSManagedObject {
        let object = NSEntityDescription.insertNewObject(forEntityName: "Customer", into: self)
        object.setValue(id, forKey: "id")
        object.setValue(name, forKey: "name")
        object.setValue(date, forKey: "date")
        object.setValue(NSSet(array: dishes), forKey: "favoriteDishes")
        return object
    }
    
    func makeDish(id: UUID = UUID(), name: String = "Pizza", price: Double = 7.99, dishDescription: String = "Delicious") -> NSManagedObject {
        let object = NSEntityDescription.insertNewObject(forEntityName: "Dish", into: self)
        object.setValue(id, forKey: "id")
        object.setValue(name, forKey: "name")
        object.setValue(price, forKey: "price")
        object.setValue(dishDescription, forKey: "dishDescription")
        return object
    }
}
