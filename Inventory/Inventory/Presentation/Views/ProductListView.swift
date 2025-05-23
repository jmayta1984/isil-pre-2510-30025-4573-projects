//
//  ProductListView.swift
//  Inventory
//
//  Created by Alumno on 2/05/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel = ProductListViewModel()
    @State var showDetail = false
    @State var selectedProduct: Product?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products) { product in
                    Text(product.name)
                        .onTapGesture {
                            selectedProduct = product
                        }
                }
                .onDelete { indexSet in
                    viewModel.deleteProduct(indexSet: indexSet)
                }
            }
            .navigationTitle("Inventory")
            .toolbar {
                Button(action: {
                    showDetail = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .sheet(isPresented: $showDetail) {
                ProductDetailView(selectedProduct: selectedProduct) { product in
                    viewModel.saveProduct(product: product, id: selectedProduct?.id)
                }
            }
            .sheet(item: $selectedProduct) { selectedProduct in
                ProductDetailView(selectedProduct: selectedProduct) { product in
                    viewModel.saveProduct(product: product, id: selectedProduct.id)
                }
            }
        }
    }
}

#Preview {
    ProductListView()
}
