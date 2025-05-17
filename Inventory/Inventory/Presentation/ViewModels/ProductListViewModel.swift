//
//  ProductListViewModel.swift
//  Inventory
//
//  Created by Alumno on 2/05/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published private(set) var products = [Product]()
    
    func saveProduct(product: Product, id: UUID?) {
        if id != nil {
            updateProduct(product: product)
        } else {
            addProduct(product: product)

        }
    }
    
    
    func addProduct(product: Product) {
        products.append(product)
    }
    
    func deleteProduct(indexSet: IndexSet){
        products.remove(atOffsets: indexSet)
    }
    
    func updateProduct(product: Product){
        products = products.map { it in
            it.id == product.id ? product : it
        }
    }
}
