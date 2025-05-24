//
//  Banner.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import SwiftUI

struct Banner: View {
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                Text("Get Your Special Sale")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .bold()
                Text("Up to 50%")
                    .foregroundStyle(Color.primaryColor)
                    .bold()
                Button(action: {}){
                    Text("Shop now")
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.primaryColor)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }
            Image("banner-adidas")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 120)
        }
        .padding()
        .background(LinearGradient(colors: [.black, .primaryColor], startPoint: .leading, endPoint: .trailing))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

