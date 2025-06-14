//
//  FavoritesViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 13/06/25.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites = [FavoriteShoe]()
    let dao = FavoriteShoeDao.shared
    
    func getFavorites() {
        favorites = dao.fetchFavorites()
    }
    
    func removeFavorite(id: Int) {
        dao.deleteFavorite(id: id)
        getFavorites()
    }
    
}
