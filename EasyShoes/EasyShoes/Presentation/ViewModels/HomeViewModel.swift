//
//  HomeViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 6/06/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var uiState: UIState<[Shoe]> = .initialState
    
    func getShoes() {
        
        uiState = .loadingState
        ShoeService().getShoes { shoes, message in
            DispatchQueue.main.async{
                if let shoes = shoes {
                    self.uiState = .successState(shoes)
                } else {
                    self.uiState = .failureState(message ?? "Unknow error")
                }
            }
        }
    }
    
}
