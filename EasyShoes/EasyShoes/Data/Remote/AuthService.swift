//
//  AuthService.swift
//  EasyShoes
//
//  Created by Alumno on 30/05/25.
//

import Foundation

class AuthService {
    
    private let url = "https://dummyjson.com/auth/login"
    
    func login(username: String, password: String, completion: @escaping(User?, String?) -> Void) {
        
        HttpRequestHelper().POST(url: url, body: UserRequestDTO(username: username, password: password)) { data, error in
            guard error == nil else {
                completion(nil, error )
                return
            }
            guard let data = data else {
                completion(nil, error )
                return
            }
            
            do {
                let response = try JSONDecoder().decode(UserDTO.self, from: data)
                completion(response.toDomain(), nil)
            } catch let decodingError {
                print("Error: \(decodingError) ")
                completion(nil, "Error: \(decodingError)")
            }
            
        }
    }
}
