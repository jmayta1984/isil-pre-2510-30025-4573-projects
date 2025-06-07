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
    @State var user: User? = nil
    @State var alertMessage = ""
    @State var showErrorAlert = false

    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack (spacing: 20){
                    TextField("Email", text: $viewModel.username)
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
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryColor)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    
                    
                }
                .disabled(viewModel.uiState == .loadingState)
                if case .loadingState = viewModel.uiState {
                    ProgressView()
                }
            }
            .padding()
            .onChange(of: viewModel.uiState) { oldValue, newValue in
                switch newValue {
                case .failureState(let message):
                    self.alertMessage = message
                    self.showErrorAlert = true
                case .successState(let user):
                    self.user = user
                default:
                    break
                }
            }
            .alert("Error", isPresented: $showErrorAlert, actions: {
                Button("OK", role: .cancel){}
                
            }, message: {
                Text(alertMessage)
            })
            .navigationDestination(item: $user) { user in
                ContentView(user: user)
            }
            
        }
    }
}

#Preview {
    LoginView()
}
