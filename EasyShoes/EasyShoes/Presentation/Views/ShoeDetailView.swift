//
//  ShoeDetailView.swift
//  EasyShoes
//
//  Created by Alumno on 6/06/25.
//

import SwiftUI

struct ShoeDetailView: View {
    let shoe: Shoe
    @StateObject var viewModel = ShoeDetailViewModel()
    let onToggle: () -> Void
    
    
    @State var selectedSize: ShoeSize? = nil
    
    var body: some View {
        VStack (alignment: .leading){
       
            ZStack (alignment:.topTrailing){
                AsyncImage(url: URL(string: shoe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                }
                Button {
                    viewModel.toggleFavorite(shoe: shoe)
                    onToggle()
                } label: {
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding()
                }
            }
           
            VStack (alignment: .leading) {
                HStack {
                    Text(shoe.name)
                        .bold()
                        .font(.headline)
                    Spacer()
                    Text(String(format: "$ %i", shoe.price))
                        .bold()
                        .font(.headline)
                }
                
                Text(shoe.brand)
                    .font(.caption)
                
                Text(shoe.description)
                    .font(.subheadline)
            }
            .padding()
            
            VStack (alignment: .leading) {
                
                Text("Sizes")
                    .bold()
                    .font(.headline)
                ScrollView (.horizontal){
                    HStack {
                        
                        ForEach(shoe.sizes) { size in
                            Text(size.id)
                                .font(.subheadline)
                                .frame(width: 40, height: 40)
                                .foregroundStyle(
                                    size == selectedSize ? .white : .gray
                                )
                                .background(
                                    size == selectedSize ?              Color.primaryColor : .white)
                            
                                .onTapGesture {
                                    selectedSize = size
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                        }
                    }
                }.scrollIndicators(.hidden)
                if let size = selectedSize {
                    Text("Stock \(size.stock)")
                        .font(.caption)
                }
                Spacer()
                Button(action: {
                    if let size = selectedSize {
                        CartItemService().addCartItem(shoeId: shoe.id, name: shoe.name, image: shoe.image, price: shoe.price, size: size.id, quantity: 1, username: "emilys") { _, _ in
                            
                        }

                    }
                }) {
                    Text("Add to cart")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryColor)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                
            }
            .padding()
            
            
        }
        .onAppear{
            viewModel.isFavorite(shoe: shoe)
        }
    }
}
