//
//  ProductDetailViewModel.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var name = ""
    @Published var dueDate = Date()
    @Published var errorMessage:String?
    
    
    func validate() -> Task? {
        guard !name.isEmpty else {
            errorMessage = "Name is empty"
            return nil
        }
        errorMessage = nil
        return Task(id: UUID(), name: name, dueDate: dueDate)
        
    }
}
