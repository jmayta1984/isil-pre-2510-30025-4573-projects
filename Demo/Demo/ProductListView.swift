//
//  ProductListView.swift
//  Demo
//
//  Created by Alumno on 11/04/25.
//

import SwiftUI

struct ProductListView: View {
    @State var products = ["Shoes", "T-Shirts", "Jeans"]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(products, id: \.self){ product in
                    
                    NavigationLink(destination: {
                        ProductDetailView(product: product)
                    }) {
                        Text(product)
                    }
                    
                }
                .onDelete { indexSet in
                    
                    guard let index = indexSet.first else { return }
                    products.remove(at: index)
                }
            }
            .navigationTitle("Products")
        }
        
        
    }
}

struct ProductDetailView: View {
    var product: String
    
    var body: some View {
        Text("Product detail: \(product)")
            .font(.title)
            .padding()
    }
}

#Preview {
    ProductListView()
}
