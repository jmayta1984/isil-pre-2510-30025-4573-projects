//
//  RestaurantListView.swift
//  FoodLab
//
//  Created by Alumno on 27/06/25.
//

import SwiftUI

struct RestaurantListView: View {
    @StateObject var viewModel = RestaurantListViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.uiState {
            case .initialState, .loadingState:
                ProgressView()
            case .succesState(let restaurants):
                List {
                    ForEach(restaurants) { restaurant in
                        RestaurantListItemView(restaurant: restaurant)
                    }
                }
                .listStyle(.plain)
            case .failureState(let message):
                Text(message)
            }
        }
        .onAppear {
            viewModel.getAllRestaurants()
        }
        
        
    }
}

#Preview {
    RestaurantListView()
}
