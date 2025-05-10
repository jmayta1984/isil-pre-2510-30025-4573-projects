//
//  TaskListViewModel.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var showDetail = false
    @Published private(set) var tasks = [Task]()
    
   
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func updateTask(task: Task) {
        tasks = tasks.map { it in
            it.id == task.id ? task : it
        }
    }
    
}
