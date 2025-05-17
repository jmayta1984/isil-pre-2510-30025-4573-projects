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
    
    let taskDao = TaskDAO()
    
   
    func addTask(task: Task) {
        taskDao.addTask(task: task)
        fetchTasks()
    }
    
    func deleteTask(indexSet: IndexSet) {
        if let index = indexSet.first {
            taskDao.deteleTask(task: tasks[index])
            fetchTasks()
        }
     }
    
    func updateTask(task: Task) {
        taskDao.updateTask(task: task)
        fetchTasks()
    }
    
    func fetchTasks(){
        tasks = taskDao.fetchTasks()
    }
    
    init() {
        fetchTasks()
    }
}
