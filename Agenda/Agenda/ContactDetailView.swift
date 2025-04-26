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
    var contact: Contact?
    
    var onSave: (Contact) -> Void
    
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
                        let id: UUID
                        if let contact = contact {
                            id = contact.id
                        } else {
                            id = UUID()
                        }
                        
                        onSave(Contact(id: id, name: name))
                        dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }
            .onAppear {
                if let contact = contact {
                    name = contact.name
                }
            }
        }
    }
}

#Preview {
    ContactDetailView {_ in }
}
