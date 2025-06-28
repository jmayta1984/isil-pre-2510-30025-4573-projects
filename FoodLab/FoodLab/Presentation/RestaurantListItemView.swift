//
//  RestaurantItemListView.swift
//  FoodLab
//
//  Created by Alumno on 27/06/25.
//

import SwiftUI

struct RestaurantListItemView: View {
    
    let restaurant: Restaurant
    var body: some View {
        Text(restaurant.title)
    }
}
