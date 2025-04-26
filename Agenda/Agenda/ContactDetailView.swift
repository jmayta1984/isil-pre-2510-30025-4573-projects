//
//  ContactDetailView.swift
//  Agenda
//
//  Created by Alumno on 25/04/25.
//

import SwiftUI

struct ContactDetailView: View {
    
    @State var name = ""
    @Environment(\.dismiss) var dismiss
    var contact: String?
    
    var onSave: (String) -> Void
    
    var title: String {
        contact == nil ? "New contact":"Edit contact"
    }
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Name", text: $name)
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        onSave(name)
                        dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }
            .onAppear {
                if let contact = contact {
                    name = contact
                }
            }
        }
    }
}

#Preview {
    ContactDetailView {_ in }
}
