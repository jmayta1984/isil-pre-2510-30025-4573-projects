//
//  ShoeCardView.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import SwiftUI

struct ShoeCardView: View {
    let shoe: Shoe
    @StateObject var viewModel = ShoeCardViewModel()
    
    var body: some View {
        VStack (alignment: .leading){
            
            ZStack (alignment: .topTrailing){
                AsyncImage(url: URL(string: shoe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 110)
                        .frame(maxWidth: .infinity)

                } placeholder: {
                    ProgressView()
                        .frame(height: 110)
                        .frame(maxWidth: .infinity)
                }
                Button {
                    viewModel.toggleFavorite(shoe: shoe)
                } label: {
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
                
            Text(shoe.name)
                .lineLimit(1)
                .font(.headline)
                .bold()
            Text(shoe.brand)
                .font(.subheadline)
            Text(String(format: "$ %i", shoe.price))
                .bold()
           
        }
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onAppear{
            viewModel.isFavorite(shoe: shoe)
        }
       
    }
}
