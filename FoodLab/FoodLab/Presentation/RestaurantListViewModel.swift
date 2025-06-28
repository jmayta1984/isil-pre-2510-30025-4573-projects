//
//  RestaurantListViewModel.swift
//  FoodLab
//
//  Created by Alumno on 27/06/25.
//

import Foundation

class RestaurantListViewModel: ObservableObject {
    
    @Published var uiState: UIState<[Restaurant]> = .initialState

    func getAllRestaurants() {
        uiState = .loadingState
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.uiState = .succesState([Restaurant(id: 1, title: "Osaka", poster: "https://media-cdn.tripadvisor.com/media/photo-s/15/9d/92/de/iluminacion-calida-influencia.jpg", latitude: -12.121945, longitude: -77.0305)])
        }
    }
}

