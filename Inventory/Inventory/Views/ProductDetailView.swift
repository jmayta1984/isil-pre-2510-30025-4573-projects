//
//  ProductDetailView.swift
//  Inventory
//
//  Created by Alumno on 2/05/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel = ProductDetailViewModel()
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $viewModel.name)
                TextField("Quantity", text: $viewModel.quantity)
                    .keyboardType(.numberPad)
            }
            
            Section {
                Button(action: {
                    let product = viewModel.validate()
                }) {
                    Text("Save")
                }
            }
            
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    ProductDetailView()
}
