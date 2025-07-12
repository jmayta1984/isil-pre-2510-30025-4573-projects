//
//  PersistenceController.swift
//  EasyMovie
//
//  Created by Alumno on 11/07/25.
//
import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init() {
        
        container = NSPersistentContainer(name: "EasyMovieModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
