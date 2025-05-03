//
//  ProductDetailViewModel.swift
//  Inventory
//
//  Created by Alumno on 2/05/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var name = ""
    @Published var quantity = ""
    
    @Published var errorMessage: String?
    
    func validate() -> Product? {
        
        guard !name.isEmpty else {
            errorMessage = "Empty name"
            return nil
        }
        
        guard !quantity.isEmpty else {
            errorMessage = "Empty quantity"
            return nil
        }
        
        guard let quantity = Int(quantity) else {
            errorMessage = "Invalid quantity"
            return nil
        }
        errorMessage = nil
        return Product(id: UUID(), name: name, quantity: quantity)
        
    }
    
}
