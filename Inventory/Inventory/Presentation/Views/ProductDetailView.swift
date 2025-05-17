//
//  ProductDetailView.swift
//  Inventory
//
//  Created by Alumno on 2/05/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel = ProductDetailViewModel()
    @Environment(\.dismiss) var dismiss
    var selectedProduct: Product?
    
    var onSave: (Product) -> Void = {_ in}
    
    var title: String {
        selectedProduct == nil ? "New product" : "Update product"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $viewModel.name)
                    TextField("Quantity", text: $viewModel.quantity)
                        .keyboardType(.numberPad)
                }
                
                Section {
                    Button(action: {
                        if let product = viewModel.validate(id: selectedProduct?.id) {
                            onSave(product)
                            dismiss()
                        }
                    }) {
                        Text("Save")
                    }
                }
                
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            .navigationTitle(title)
            .onAppear {
                if let selectedProduct = selectedProduct {
                    viewModel.loadData(product: selectedProduct)
                }
            }
        }
    }
}

#Preview {
    ProductDetailView()
}
