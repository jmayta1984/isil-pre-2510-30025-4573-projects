//
//  TaskEntity+Extensions.swift
//  ToDo
//
//  Created by Alumno on 16/05/25.
//
import Foundation

extension TaskEntity {
    
    func fromDomain(task: Task) {
        self.id = task.id
        self.name = task.name
        self.dueDate = task.dueDate
    }
    
    func toDomain() -> Task {
        Task(id: id ?? UUID(), name: name ?? "", dueDate: dueDate ?? Date())
    }
}
