//
//  FavoriteCardView.swift
//  EasyShoes
//
//  Created by Alumno on 20/06/25.
//

import SwiftUI

struct FavoriteCardView: View {
    @State var showOptions = false
    @State var showSizes = false
    
    @EnvironmentObject var viewModel: FavoritesViewModel
    
    let favorite: FavoriteShoe
    var body: some View {
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
                                .stroke(Color.primaryColor, lineWidth: 2)
                        }
                }
                .buttonStyle(.borderless)
            //    .foregroundStyle(.black)
                
                
                
                
            }
            Spacer()
            Button {
                showOptions = true
            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .rotationEffect(Angle(degrees: 90))
               //     .foregroundStyle(.black)
            }
            .buttonStyle(.borderless)
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
                    viewModel.removeFavorite(id: favorite.id)
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
