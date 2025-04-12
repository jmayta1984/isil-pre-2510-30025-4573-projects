//
//  LoginScreen.swift
//  Demo
//
//  Created by Alumno on 11/04/25.
//

import SwiftUI

struct LoginScreen: View {
    
    @State var username = ""
    @State var password = ""
    @State var isVisible = false
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 8)
            
            ZStack(alignment: .trailing) {
                Group {
                    if (isVisible) {
                        TextField("Password", text: $password)
                            .autocapitalization(.none)
                    } else {
                        SecureField("Password", text: $password)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    isVisible.toggle()
                }) {
                    Image(systemName: isVisible ? "eye": "eye.slash" )
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal, 8)
            
            Button(action: { }) {
                Text("Sign in")
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 8)
                
                
            }
            Button(action: {
            }) {
                Text("Sign out")
            }
            
        }
    }
}




#Preview {
    LoginScreen()
}
