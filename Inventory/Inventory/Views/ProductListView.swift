//
//  ProductListView.swift
//  Inventory
//
//  Created by Alumno on 2/05/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel = ProductListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products) { product in
                    Text(product.name)
                }
                .onDelete { indexSet in
                    viewModel.deleteProduct(indexSet: indexSet)
                }
            }
            .navigationTitle("Inventory")
            .toolbar {
                Button(action: {
                    viewModel.addProduct(product: Product(id: UUID(), name: "Laptop", quantity: 70))
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        }
    }
}

#Preview {
    ProductListView()
}
