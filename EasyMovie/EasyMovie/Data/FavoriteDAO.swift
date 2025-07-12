//
//  FavoriteDAO.swift
//  EasyMovie
//
//  Created by Alumno on 11/07/25.
//

import CoreData

class FavoriteDAO {
    
    static let shared = FavoriteDAO()
    
    private init() {}
    
    let context = PersistenceController.shared.container.viewContext
    
    private func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
    
    func insertFavorite(movie: Movie) {
        let entity = FavoriteEntity(context: context)
        entity.id = Int32(movie.id)
        entity.poster = movie.poster
        entity.title = movie.title
        saveContext()
        print("Insert")
    }
    
    func deleteFavorite(id: Int) {
        let fetchRequest: NSFetchRequest<FavoriteEntity>
        fetchRequest = FavoriteEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: " id = %i", argumentArray: [id])
        
        do {
            let entities = try context.fetch(fetchRequest)
            if let entity = entities.first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchAllFavorites() -> [FavoriteMovie] {
        let fetchRequest: NSFetchRequest<FavoriteEntity>
        fetchRequest = FavoriteEntity.fetchRequest()
     
        
        do {
            let entities = try context.fetch(fetchRequest)
            let movies = entities.map { entity in
                FavoriteMovie(id: Int(entity.id),
                              title: entity.title ?? "",
                              poster: entity.poster ?? "")
            }
            return movies
          
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
    }
    
    func isFavorite(id: Int) -> Bool {
        let fetchRequest: NSFetchRequest<FavoriteEntity>
        fetchRequest = FavoriteEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: " id = %i", argumentArray: [id])

        
        do {
            let entities = try context.fetch(fetchRequest)
            return !entities.isEmpty
          
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
    }
}
