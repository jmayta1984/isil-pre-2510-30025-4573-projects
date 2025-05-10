//
//  Untitled.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

import CoreData

struct PersitenceController {
    
    static let shared = PersitenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "ToDoModel")
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("\(error)")
            }
        }
    }
}
