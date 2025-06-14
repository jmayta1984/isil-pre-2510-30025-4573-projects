//
//  PersistenceController.swift
//  EasyShoes
//
//  Created by Alumno on 13/06/25.
//

import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init() {
        self.container = NSPersistentContainer(name: "EasyShoesmodel")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
