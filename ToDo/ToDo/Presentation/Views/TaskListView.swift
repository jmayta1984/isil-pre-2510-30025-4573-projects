//
//  ProductListView.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var viewModel = TaskListViewModel()
    
    @State var selectedTask:Task? = nil
    
    var body: some View {
    
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    Text(task.name)
                        .onTapGesture {
                            selectedTask = task
                        }
                }
                .onDelete { indexSet in
                    viewModel.deleteTask(indexSet: indexSet)
                }
            }
            .navigationTitle("To do")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        viewModel.showDetail = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showDetail) {
                TaskDetailView { task in
                    viewModel.addTask(task: task)
                }
            }
            .sheet(item: $selectedTask) { task in
                TaskDetailView(selectedTask: task) { task in
                    viewModel.updateTask(task: task)
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}
