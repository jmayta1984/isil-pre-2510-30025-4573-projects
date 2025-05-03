//
//  ProductListViewModel.swift
//  Inventory
//
//  Created by Alumno on 2/05/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published private(set) var products = [Product]()
    
    func addProduct(product: Product) {
        products.append(product)
    }
    
    func deleteProduct(indexSet: IndexSet){
        products.remove(atOffsets: indexSet)
    }
    
    func updateProduct(){
        
    }
}
