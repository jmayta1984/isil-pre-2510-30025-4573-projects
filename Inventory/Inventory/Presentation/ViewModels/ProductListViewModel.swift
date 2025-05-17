//
//  ProductListViewModel.swift
//  Inventory
//
//  Created by Alumno on 2/05/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published private(set) var products = [Product]()
    let productDao = ProductDao()
    
    init() {
        fetchProducts()
    }
    
    func saveProduct(product: Product, id: UUID?) {
        if id != nil {
            productDao.updateProduct(product: product)
        } else {
            productDao.addProduct(product: product)
        }
        fetchProducts()
    }
    
    func deleteProduct(indexSet: IndexSet){
        
        if let index = indexSet.first {
            productDao.deleteProduct(product: products[index])
        }
        fetchProducts()
    }
    
    func fetchProducts() {
       products = productDao.fetchProducts()
    }
    

}
