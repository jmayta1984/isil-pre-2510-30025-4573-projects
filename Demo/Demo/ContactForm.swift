//
//  ContactForm.swift
//  Demo
//
//  Created by Alumno on 11/04/25.
//

import SwiftUI

struct ContactForm: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var subscribe = false
    
    var body: some View {
        Form {
            Section(header: Text("Información personal")) {
                TextField("Nombre", text: $name)
                TextField("Correo", text: $email)
                    .keyboardType(.emailAddress)
            }
            Section {
                Toggle("Suscribirse al boletín", isOn: $subscribe)
            }
        }
    }
}

#Preview {
    ContactForm()
}
