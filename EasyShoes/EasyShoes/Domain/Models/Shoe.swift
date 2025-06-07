//
//  Shoe.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import Foundation

struct Shoe: Identifiable, Equatable {
    let id: Int
    let name: String
    let brand: String
    let gender: String
    let category: String
    let price: Int
    let image: String
    let description: String
    let sizes: [ShoeSize]
}

struct ShoeSize: Identifiable, Equatable {
    let id: String
    let stock: Int
    
}
