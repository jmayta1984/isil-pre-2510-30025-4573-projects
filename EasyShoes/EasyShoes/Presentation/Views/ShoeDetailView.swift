//
//  ShoeDetailView.swift
//  EasyShoes
//
//  Created by Alumno on 6/06/25.
//

import SwiftUI

struct ShoeDetailView: View {
    let shoe: Shoe
    
    var body: some View {
        VStack {
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
        }
    }
}
