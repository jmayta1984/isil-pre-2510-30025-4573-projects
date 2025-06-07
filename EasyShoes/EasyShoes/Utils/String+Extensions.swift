//
//  String+Extensions.swift
//  EasyShoes
//
//  Created by Alumno on 6/06/25.
//

extension String {
    
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst().lowercased()
    }
}
