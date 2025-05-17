//
//  ContactListView.swift
//  AgendaMVVM
//
//  Created by Alumno on 16/05/25.
//

import SwiftUI

struct ContactListView: View {
    
    @State var showDetail = false
    
    var body: some View {
        NavigationStack {
            
            List {
                
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showDetail = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                ContactDetailView()
            }
        }
    }
}

#Preview {
    ContactListView()
}
