//
//  CartItemRequestDTO.swift
//  EasyShoes
//
//  Created by Alumno on 20/06/25.
//

struct CartItemRequestDTO: Encodable {
    let shoeId: Int
    let name: String
    let size: String
    let quantity: Int
    let price: Int
    let image: String
    let username: String
    
    enum CodingKeys: String, CodingKey {
        case shoeId = "shoe_id"
        case name
        case size
        case quantity
        case price
        case image
        case username
    }
}

