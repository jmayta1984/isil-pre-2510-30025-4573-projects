//
//  ProductDetailViewModel.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

import Foundation

class TaskDetailViewModel: ObservableObject {
    @Published var name = ""
    @Published var dueDate = Date()
    @Published var errorMessage:String?
    
    func loadTask(task: Task) {
        name = task.name
        dueDate = task.dueDate
    }
    
    func validate() -> Task? {
        guard !name.isEmpty else {
            errorMessage = "Name is empty"
            return nil
        }
        errorMessage = nil
        return Task(id: UUID(), name: name, dueDate: dueDate)
        
    }
}
