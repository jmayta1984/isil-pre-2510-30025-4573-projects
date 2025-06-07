//
//  ContentView.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import SwiftUI

struct ContentView: View {
    let user: User
    var body: some View {
        TabView {
            Tab("Home", systemImage: "shoe") {
                HomeView()
            }
            
            Tab("Favorites", systemImage: "heart") {
                Text("Favorites")
            }
            
            Tab("Cart", systemImage: "cart") {
                Text("Cart")
            }
                    
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Text("Hi, \(user.name)")
                        .bold()
                    AsyncImage(url: URL(string: user.image)) { image in
                        image
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color.primaryColor, lineWidth: 2)
                    
                            }

                            
                    } placeholder: {
                        ProgressView()
                    }

                }
            }
        }
        .navigationBarBackButtonHidden()
        
        .tint(Color.primaryColor)
    }
}


