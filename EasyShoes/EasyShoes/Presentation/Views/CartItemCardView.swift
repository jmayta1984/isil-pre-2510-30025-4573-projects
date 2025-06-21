//
//  CartItemCardView.swift
//  EasyShoes
//
//  Created by Alumno on 20/06/25.
//

import SwiftUI

struct CartItemCardView: View {
    let cartItem: CartItem
    @State var showOptions = false
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: cartItem.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 100)
                
            } placeholder: {
                ProgressView()
                    .frame(width: 120, height: 100)
            }
            VStack (alignment: .leading) {
                Text(cartItem.name)
                    .lineLimit(1)
                    .font(.headline)

                Text("Quantity: \(cartItem.quantity)").font(.subheadline)
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
            }
            .buttonStyle(.borderless)
        }
        .sheet(isPresented: $showOptions) {
            VStack {
                Text("Options").bold()
                HStack  {
                    Image(systemName: "shoe")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Change size")
                    Spacer()
                }
                .padding(.horizontal)
                .onTapGesture {
                    showOptions = false
                }

                HStack {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Remove from cart")
                    Spacer()
                }
                .padding(.horizontal)
                .onTapGesture {
                    showOptions = false
                }
            }
            .presentationDetents([.height(120)])

        }
    }
}
