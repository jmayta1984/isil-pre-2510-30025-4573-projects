//
//  FavoriteListViewModel.swift
//  EasyMovie
//
//  Created by Alumno on 11/07/25.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    @Published var favorites = [FavoriteMovie]()
    
    func getAllFavorites() {
        let dao = FavoriteDAO.shared
        favorites = dao.fetchAllFavorites()
    }
    
    func deleteFavorite(indexSet: IndexSet) {
        if let index = indexSet.first {
            let favorite = favorites[index]
            let dao = FavoriteDAO.shared
            dao.deleteFavorite(id: favorite.id)

        }
    }
    
    
}

