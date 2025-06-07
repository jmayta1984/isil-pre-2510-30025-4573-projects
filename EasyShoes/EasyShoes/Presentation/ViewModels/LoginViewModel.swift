//
//  LoginViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 30/05/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username = "emilys"
    @Published var password = "emilyspass"
    
    @Published var uiState: UIState<User> = .initialState
    
    let authService = AuthService()
    
    func login()  {
        uiState = .loadingState
        authService.login(username: username, password: password) { user, message in
            
            DispatchQueue.main.async {
                if let user = user {
                    self.uiState = .successState(user)
                } else {
                    self.uiState = .failureState(message ?? "Unknow error")
                }
            }
           
        }
    }
}
