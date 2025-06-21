//
//  FavoritesView.swift
//  EasyShoes
//
//  Created by Alumno on 13/06/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var viewModel: FavoritesViewModel
    @State var selectedFavoriteShoe: FavoriteShoe? = nil

    var body: some View {
        VStack {
            
            if (viewModel.favorites.isEmpty) {
                Text("No favorites")
            }
            else {
                List {
                    ForEach(viewModel.favorites) { favorite in
                        FavoriteCardView(favorite: favorite)
                            .background(.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                            .padding(4)
                    }
                    .onDelete { indexSet in
                        if let index = indexSet.first {
                            viewModel.removeFavorite(id: viewModel.favorites[index].id)
                        }
                        
                    }
                    
                }
                .listStyle(PlainListStyle())
            }
        }
        .onAppear {
            viewModel.getFavorites()
        }
        
    }
}
