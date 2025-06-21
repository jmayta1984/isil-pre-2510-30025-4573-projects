//
//  CartView.swift
//  EasyShoes
//
//  Created by Alumno on 20/06/25.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel = CartItemViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.cartItems.isEmpty {
                Text("No items")
            } else {
                List {
                    ForEach (viewModel.cartItems) { cartItem in
                        CartItemCardView(cartItem: cartItem)
                    }
                }
                .listStyle(.plain)
            }
         }
       
        .onAppear {
            viewModel.getCartItems(user: authViewModel.user)
        }
    }
}
