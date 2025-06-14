//
//  FavoritesView.swift
//  EasyShoes
//
//  Created by Alumno on 13/06/25.
//

import SwiftUI

struct FavoritesView: View {
    

    @State var showOptions = false
    @State var showSizes = false
    
    @StateObject var viewModel = FavoritesViewModel()
    
    @State var selectedFavoriteShoe: FavoriteShoe? = nil

    
    var body: some View {
        VStack {
            
            if (viewModel.favorites.isEmpty) {
                Text("No favorites")
            }
            else {
                List {
                    ForEach(viewModel.favorites) { favorite in
                        HStack {
                            AsyncImage(url: URL(string: favorite.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 100)
                                
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 120, height: 100)
                            }
                            
                            VStack (alignment: .leading) {
                                Text(favorite.name)
                                    .lineLimit(1)
                                    .font(.headline)
                                
                                Text(String(format: "$ %i", favorite.price))
                                Button {
                                    showSizes = true
                                } label: {
                                    Text("Add to cart")
                                        .padding(.horizontal, 8)
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(.black, lineWidth: 2)
                                        }
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                
                                
                                
                            }
                            Spacer()
                            Button {
                                showOptions = true
                                selectedFavoriteShoe = favorite
                            } label: {
                                Image(systemName: "ellipsis")
                                    .rotationEffect(Angle(degrees: 90))
                            }
                            .buttonStyle(.plain)
                        }
                        
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
        .sheet(isPresented: $showOptions) {
            VStack {
                Text("Options").bold()
                HStack  {
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Add to cart")
                    Spacer()
                }
                .padding(.horizontal)
                .onTapGesture {
                    showOptions = false
                    showSizes = true
                }

                HStack {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Remove from favorites")
                    Spacer()
                }
                .padding(.horizontal)
                .onTapGesture {
                    if let favorite = selectedFavoriteShoe {
                        viewModel.removeFavorite(id: favorite.id)
                    }
                    
                    showOptions = false
                }
            }
            .presentationDetents([.height(120)])

        }
        
        .sheet(isPresented: $showSizes) {
            VStack  {
                Text("Sizes").bold()
                Spacer()
            }
            .presentationDetents([.height(120)])

        }
    }
}
