//
//  ProductDetailView.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel = ProductDetailViewModel()

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
                        if let task = viewModel.validate() {
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
            .navigationTitle("New task")
        }
        
    }
}

#Preview {
    ProductDetailView()
}
