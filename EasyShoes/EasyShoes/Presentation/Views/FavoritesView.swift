//
//  FavoritesView.swift
//  EasyShoes
//
//  Created by Alumno on 13/06/25.
//

import SwiftUI

struct FavoritesView: View {
    
    let favorites = [
        FavoriteShoe(id: 1, name: "Adidas Samba", image: "https://www.stripe3.com/cdn/shop/files/IH6001_1_FOOTWEAR_Photography_SideLateralCenterView_transparent.png", price: 120),
        FavoriteShoe(id: 2, name: "Adidas Samba", image: "https://www.stripe3.com/cdn/shop/files/IH6001_1_FOOTWEAR_Photography_SideLateralCenterView_transparent.png", price: 120),
        FavoriteShoe(id: 3, name: "Adidas Samba", image: "https://www.stripe3.com/cdn/shop/files/IH6001_1_FOOTWEAR_Photography_SideLateralCenterView_transparent.png", price: 120),
        FavoriteShoe(id: 4, name: "Adidas Samba", image: "https://www.stripe3.com/cdn/shop/files/IH6001_1_FOOTWEAR_Photography_SideLateralCenterView_transparent.png", price: 120),
                     
    ]
    @State var showOptions = false
    @State var showSizes = false
    
    var body: some View {
        VStack {
            List {
                ForEach(favorites) { favorite in
                    HStack {
                        AsyncImage(url: URL(string: favorite.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 80)

                        } placeholder: {
                            ProgressView()
                                .frame(width: 100, height: 80)
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
            }
            .listStyle(PlainListStyle())
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
