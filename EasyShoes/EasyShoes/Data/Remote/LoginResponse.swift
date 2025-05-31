//
//  LoginResponse.swift
//  EasyShoes
//
//  Created by Alumno on 30/05/25.
//

struct LoginResponse: Decodable {
    let id: Int
    let username: String
    let emal: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
}
