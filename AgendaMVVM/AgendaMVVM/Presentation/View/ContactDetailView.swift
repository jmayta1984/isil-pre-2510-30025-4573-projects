//
//  ContactDetailView.swift
//  AgendaMVVM
//
//  Created by Alumno on 16/05/25.
//

import SwiftUI

struct ContactDetailView: View {
        
    @StateObject var viewModel = ContactDetailViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $viewModel.name)
                    TextField("Phone", text: $viewModel.phone)
                    TextField("Company", text: $viewModel.company)
                    
                }
                Section {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("New contact")
        }
    }
}

#Preview {
    ContactDetailView()
}
