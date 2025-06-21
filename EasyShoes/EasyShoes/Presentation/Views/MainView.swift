//
//  MainView.swift
//  EasyShoes
//
//  Created by Alumno on 20/06/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        
        Group {
            if viewModel.user == nil {
                LoginView()
            } else {
                ContentView()
            }
        }
        .environmentObject(viewModel)
       
    }
}
