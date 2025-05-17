//
//  ProductDetailView.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

import SwiftUI

struct TaskDetailView: View {
    @StateObject var viewModel = TaskDetailViewModel()

    var selectedTask: Task? = nil
    var onSave: (Task) -> Void = {_ in}
    var title: String  {
        
        selectedTask == nil ? "New task" : "Update task"
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $viewModel.name)
                        .autocorrectionDisabled()
                    DatePicker("Due date", selection: $viewModel.dueDate, in: Date()..., displayedComponents: [.date])
                }
                Section {
                    Button(action: {
                        if let task = viewModel.validate(id: selectedTask?.id) {
                            onSave(task)
                            dismiss()

                        }
                    }) {
                        Text("Save")
                    }
                }
                Group {
                    if let error = viewModel.errorMessage {
                        Text(error).foregroundStyle(.red)
                    }
                }
                
            }
            .navigationTitle(title)
            .onAppear {
                if let task = selectedTask {
                    viewModel.loadTask(task: task)
                }
            }
        }
        
    }
}

#Preview {
    TaskDetailView()
}
