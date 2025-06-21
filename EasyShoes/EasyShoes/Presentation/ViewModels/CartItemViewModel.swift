//
//  CartItemViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 20/06/25.
//

import Foundation

class CartItemViewModel: ObservableObject {
    @Published var cartItems = [CartItem]()
    
    func getCartItems(user: User?) {
        
        if let user = user {
            CartItemService().getCartItemByUser(username: user.username) { cartItems, _ in
                
                DispatchQueue.main.async {
                    if let cartItems = cartItems {
                        print("Entré \(cartItems.count)")
                        self.cartItems = cartItems
                    }
                }
                
            }
        }
        
    }
    
    func addCartItem() {
        
    }
    
    func removeCartItem() {
        
    }
    
    func updateCartItem() {
        
    }
}
