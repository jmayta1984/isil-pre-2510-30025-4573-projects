//
//  ShoeCardViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 13/06/25.
//


import Foundation

class ShoeCardViewModel: ObservableObject {
    let dao = FavoriteShoeDao.shared
    
    @Published var isFavorite = false
    
    func toggleFavorite(shoe: Shoe) {
        isFavorite.toggle()
        if (isFavorite) {
            addFavorite(shoe: shoe)
        } else {
            removeFavorite(id: shoe.id)
        }
    }
    
    
    private func addFavorite(shoe: Shoe) {
        dao.insertFavorite(favorite: FavoriteShoe(id: shoe.id, name: shoe.name, image: shoe.image, price: shoe.price))
    }
    
    private func removeFavorite(id: Int) {
        dao.deleteFavorite(id: id)
    }
    
    func isFavorite(shoe: Shoe) {
        isFavorite = dao.isFavorite(id: shoe.id)
    }
}
