//
//  FavoriteListView.swift
//  EasyMovie
//
//  Created by Alumno on 11/07/25.
//

import SwiftUI

struct FavoriteListView: View {
    @StateObject var viewModel = FavoriteListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.favorites){ favorite  in
                Text(favorite.title)
                    
            }
            .onDelete { indexSet in
                viewModel.deleteFavorite(indexSet: indexSet)
            }
        }
        .onAppear {
            viewModel.getAllFavorites()
        }
    }
}
