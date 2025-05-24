//
//  ContentView.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "shoe") {
                Text("Home")
            }
            
            Tab("Favorites", systemImage: "heart") {
                Text("Favorites")
            }
            
            Tab("Cart", systemImage: "cart") {
                Text("Cart")
            }
                    
        }
        .tint(Color.primaryColor)
    }
}

#Preview {
    ContentView()
}
