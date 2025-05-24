//
//  Shoe.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import Foundation

struct Shoe: Identifiable, Decodable {
    let id: Int
    let name: String
    let brand: String
    let gender: String
    let category: String
    let price: Int
    let image: String
}

func loadShoesFromJson() -> [Shoe] {
    
    
    guard let url = Bundle.main.url(forResource: "shoes", withExtension: "json")
         
    else {
        print("Wrong URL")
        return []
    }
    
    guard let data = try? Data(contentsOf: url) else {
        print("Wrong data")
        return []
    }
   
    guard  let shoes = try? JSONDecoder().decode([Shoe].self, from: data) else {
        print("Wrong decoding")
        return []
    }
    
    return shoes
}
