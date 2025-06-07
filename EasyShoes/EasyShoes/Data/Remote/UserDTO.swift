//
//  LoginResponse.swift
//  EasyShoes
//
//  Created by Alumno on 30/05/25.
//

struct UserDTO: Decodable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
    
    func toDomain() -> User {
        User(id: id, username: username, name: "\(firstName) \(lastName)", image: image)
    }
}
