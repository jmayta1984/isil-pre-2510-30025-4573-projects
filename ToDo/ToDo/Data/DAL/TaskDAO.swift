//
//  TaskDAO.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

class TaskDAO {
    private let context = PersitenceController.shared.container.viewContext
    
    private func saveContext() {
        do {
            try context.save()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func add(task: Task) {
        let taskEntity = TaskEntity(context: context)
        taskEntity.id = task.id
        taskEntity.name = task.name
        taskEntity.dueDate = task.dueDate
        saveContext()
    }
}

