//
//  TaskDAO.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

import CoreData

class TaskDAO {
    private let context = PersitenceController.shared.container.viewContext
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    func addTask(task: Task) {
        let taskEntity = TaskEntity(context: context)
        taskEntity.fromDomain(task: task)
        saveContext()
    }
    
    func deteleTask(task: Task) {
        let request: NSFetchRequest<TaskEntity>
        request = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: " id = %@", task.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<TaskEntity>
        request = TaskEntity.fetchRequest()
        
        do {
            let entities = try context.fetch(request)
            return entities.map { entity in
                entity.toDomain()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateTask(task: Task) {
        let request: NSFetchRequest<TaskEntity>
        request = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: " id = %@", task.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first {
                entity.fromDomain(task: task)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}

