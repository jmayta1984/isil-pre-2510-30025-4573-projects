//
//  CartItemDTO.swift
//  EasyShoes
//
//  Created by Alumno on 20/06/25.
//

struct CartItemDTO: Decodable {
    let id: Int
    let shoeId: Int
    let name: String
    let size: String
    let quantity: Int
    let price: Int
    let image: String
    let username: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case shoeId = "shoe_id"
        case name
        case size
        case quantity
        case price
        case image
        case username
    }
    
    func toDomain() -> CartItem {
        CartItem(id: id, shoeId: shoeId, name: name, size: size, quantity: quantity, price: price, image: image, username: username)
    }
}
