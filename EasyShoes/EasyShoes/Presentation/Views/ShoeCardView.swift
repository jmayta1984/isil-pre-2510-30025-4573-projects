//
//  ShoeCardView.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import SwiftUI

struct ShoeCardView: View {
    let shoe: Shoe
    
    var body: some View {
        VStack (alignment: .leading){
            
            ZStack (alignment: .topTrailing){
                AsyncImage(url: URL(string: shoe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 110)
                } placeholder: {
                    ProgressView()
                }
                Button(action: {}) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.primaryColor)
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

       
    }
}

#Preview {
    ShoeCardView(shoe: Shoe(id: 1, name: "Nike React Infinity Run Flyknit", brand: "Nike", gender: "Men", category: "Running", price: 160, image: "https://www.fit2run.com/cdn/shop/files/DH5392-007-PHSRH001-1500.png"))
}
