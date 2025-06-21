//
//  CartItemService.swift
//  EasyShoes
//
//  Created by Alumno on 20/06/25.
//

import Foundation

class CartItemService {
    
    private let url = "https://sugary-wool-penguin.glitch.me/items"
    
    func addCartItem(shoeId: Int, name: String, image: String, price: Int, size: String, quantity: Int, username: String, completion: @escaping(CartItem?, String?) -> Void) {
        
        HttpRequestHelper().POST(url: url, body: CartItemRequestDTO(shoeId: shoeId, name: name, size: size, quantity: quantity, price: price, image: image, username: username) ) { data, error in
            guard error == nil else {
                completion(nil, error )
                return
            }
            guard let data = data else {
                completion(nil, error )
                return
            }
            
            do {
                let response = try JSONDecoder().decode(CartItemDTO.self, from: data)
                completion(response.toDomain(), nil)
            } catch let decodingError {
                print("Error: \(decodingError) ")
                completion(nil, "Error: \(decodingError)")
            }
            
        }
    }
}
