//
//  Product.swift
//  Inventory
//
//  Created by Alumno on 2/05/25.
//
import Foundation

struct Product: Identifiable, Equatable {
    let id: UUID
    let name: String
    let quantity: Int
}

