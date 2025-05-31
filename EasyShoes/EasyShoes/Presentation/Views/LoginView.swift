//
//  LoginView.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    @State var isVisible = false
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 20){
                TextField("Email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                HStack {
                    if isVisible {
                        TextField("Password", text: $viewModel.password)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                    } else {
                        SecureField("Password", text: $viewModel.password)
                        
                    }
                    Button(action: {
                        isVisible.toggle()
                    }) {
                        Image(systemName: isVisible ? "eye" :"eye.slash" )
                            .tint(Color.primaryColor)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Sign in")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primaryColor)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Group {
                    if let message = viewModel.errorMessage {
                        Text(message)
                            .foregroundStyle(Color.primaryColor)
                    }
                }
            }
            .padding()
            .navigationDestination(item: $viewModel.user) { user in
                ContentView(user: user)
            }
            
        }
    }
}

#Preview {
    LoginView()
}
