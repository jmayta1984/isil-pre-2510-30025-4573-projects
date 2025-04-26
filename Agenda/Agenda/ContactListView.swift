//
//  ContactListView.swift
//  Agenda
//
//  Created by Alumno on 25/04/25.
//

import SwiftUI

struct ContactListView: View {
    @State var contacts = [String]()
    @State var showDetail = false
    @State var selectedContact: String?
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(contacts, id:\.self) { contact in
                    Text(contact)
                        .onTapGesture {
                            selectedContact = contact
                            showDetail = true
                        }
                }
                .onDelete { indexSet in
                    contacts.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle(Text("Agenda"))
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        selectedContact = nil
                        showDetail = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                ContactDetailView(contact: selectedContact) { contact in
                    
                    if let existingContact = selectedContact {
                        contacts = contacts.map { $0 == existingContact ? contact:$0 }
                    } else {
                        contacts.append(contact)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContactListView()
}
