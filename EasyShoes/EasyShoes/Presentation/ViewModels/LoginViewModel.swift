//
//  LoginViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 30/05/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String? = nil
    @Published var user: User? = nil
    
    let authService = AuthService()
    
    func login()  {
        authService.login(username: email, password: password) { user, message in
            
            DispatchQueue.main.async {
                self.errorMessage = message
                self.user = user
            }
           
        }
    }
}
