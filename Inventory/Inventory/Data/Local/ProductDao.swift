//
//  ProductDap.swift
//  Inventory
//
//  Created by Alumno on 16/05/25.
//

import CoreData

class ProductDao {
    
    private let context = PersistenceController.shared.container.viewContext
    
    func addProduct(product: Product) {
        let productEntity = ProductEntity(context: context)
        productEntity.fromDomain(product: product)
        saveContext()
    }
    
    func deleteProduct(product: Product) {
        let request: NSFetchRequest<ProductEntity>
        request = ProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", product.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first  {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateProduct(product: Product) {
        let request: NSFetchRequest<ProductEntity>
        request = ProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", product.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first  {
                entity.fromDomain(product: product)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchProducts() -> [Product] {
        let request: NSFetchRequest<ProductEntity>
        request = ProductEntity.fetchRequest()
        
        do {
            let entities = try context.fetch(request)
            return entities.map { entity in
                entity.toDomain()
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
