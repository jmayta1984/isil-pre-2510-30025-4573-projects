//
//  ProductEntity+Extensions.swift
//  Inventory
//
//  Created by Alumno on 16/05/25.
//

import Foundation

extension ProductEntity {
    func fromDomain(product: Product) {
        self.id = product.id
        self.name = product.name
        self.quantity = Int16(product.quantity)
    }
    
    func toDomain() -> Product {
        Product(id: self.id ?? UUID(), name: self.name ?? "", quantity: Int(self.quantity))
    }
}
