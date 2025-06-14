//
//  FavoriteShoeDao.swift
//  EasyShoes
//
//  Created by Alumno on 13/06/25.
//

import CoreData

class FavoriteShoeDao{
    let context = PersistenceController.shared.container.viewContext
    
    func insertFavorite(favorite: FavoriteShoe) {
        let entity = FavoriteShoeEntity(context: context)
        entity.id = Int16(favorite.id)
        entity.name = favorite.name
        entity.image = favorite.image
        entity.price = Int16(favorite.price)
        saveContext()
    }
    
    
    func deleteFavorite(id: Int) {
        let request: NSFetchRequest<FavoriteShoeEntity>
        request = FavoriteShoeEntity.fetchRequest()
        
        request.predicate = NSPredicate(format: " id = %i", id as CVarArg)
        
        do {
            let entities = try context.fetch(request)
            if let entity = entities.first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
    }
    
    func fetchFavorites() -> [FavoriteShoe]{
        let request: NSFetchRequest<FavoriteShoeEntity>
        request = FavoriteShoeEntity.fetchRequest()
        
        
        do {
            let entities = try context.fetch(request)
            return entities.map { entity in
                FavoriteShoe(id: Int(entity.id), name: entity.name ?? "", image: entity.image ?? "", price: Int(entity.price))
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
        
    }
}
