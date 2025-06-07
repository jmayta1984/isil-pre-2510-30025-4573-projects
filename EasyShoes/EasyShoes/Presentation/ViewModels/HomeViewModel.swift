//
//  HomeViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 6/06/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var shoes = [Shoe]()
    @Published var errorMessage: String? = nil
    
    func getShoes() {
        
        ShoeService().getShoes { shoes, message in
            DispatchQueue.main.async{
                if let shoes = shoes {
                    self.shoes = shoes
                } else {
                    self.errorMessage = message
                }
            }
        }
    }
    
}
