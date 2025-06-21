//
//  ContentView.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var favoriteViewModel = FavoritesViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
  
    var body: some View {
        NavigationStack {
            TabView {
                Tab("Home", systemImage: "shoe") {
                    HomeView()
                }
                
                Tab("Favorites", systemImage: "heart") {
                    FavoritesView()
                }
                
                Tab("Cart", systemImage: "cart") {
                    CartView()
                }
                        
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        if let user = authViewModel.user {
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
            }
        }
        
        
        .tint(Color.primaryColor)
        .environmentObject(favoriteViewModel)
    }
}


