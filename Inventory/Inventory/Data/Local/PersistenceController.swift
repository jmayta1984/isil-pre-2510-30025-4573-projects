//
//  PersistenceController.swift
//  Inventory
//
//  Created by Alumno on 16/05/25.
//

import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
   
    var container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "InventoryModel")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
}
