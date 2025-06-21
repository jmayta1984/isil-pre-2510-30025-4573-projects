//
//  ShoeService.swift
//  EasyShoes
//
//  Created by Alumno on 6/06/25.
//

import Foundation

class ShoeService {
    
    func getShoes(completion: @escaping([Shoe]?, String?) -> Void) {
        
        let url = "https://sugary-wool-penguin.glitch.me/shoes"
        
        HttpRequestHelper().GET(url: url) { data, error in
            guard error == nil else {
                completion(nil, error )
                return
            }
            guard let data = data else {
                completion(nil, error )
                return
            }
            
            do {
                let response = try JSONDecoder().decode([ShoeDTO].self, from: data).map { $0.toDomain() }
                completion(response, nil)
            } catch let decodingError {
                print("Error: \(decodingError) ")
                completion(nil, "Error: \(decodingError)")
            }
        }
    }
}
