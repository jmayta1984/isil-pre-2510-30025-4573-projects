//
//  LoginView.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 20){
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {}) {
                    Text("Sign in")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primaryColor)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()

        }
    }
}

#Preview {
    LoginView()
}
