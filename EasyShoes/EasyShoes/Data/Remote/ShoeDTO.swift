//
//  ShoeDTO.swift
//  EasyShoes
//
//  Created by Alumno on 6/06/25.
//

import Foundation

struct ShoeDTO: Decodable {
    let id: Int
    let name: String
    let brand: String
    let gender: String
    let category: String
    let price: Int
    let image: String
    let rating: Double
    let reviews: Int
    let description: String
    let colors: [String]
    let sizes: [ShoeSizeDTO]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case brand
        case gender
        case category
        case price
        case image
        case rating
        case reviews = "review_count"
        case description
        case colors = "available_colors"
        case sizes = "sizes_available"
    }
    
    func toDomain() -> Shoe {
        Shoe(id: id, name: name, brand: brand.capitalizeFirstLetter(), gender: gender.capitalizeFirstLetter(), category: category.capitalizeFirstLetter(), price: price, image: image)
    }
}

struct ShoeSizeDTO: Decodable {
    let size: Double
    let stock: Int
    
    enum CodingKeys: String, CodingKey {
        case size
        case stock = "quantity"
    }
}
