//
//  ContentView.swift
//  Animations
//
//  Created by Alumno on 27/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            Tab("Animation",systemImage: "circle") {
                ImplicitAnimation()
            }
            
            Tab("Transtition", systemImage: "rectangle") {
                TransitionAnimation()
            }
            
            Tab("Infite", systemImage: "arrow.2.circlepath") {
                RotateInfinite()
            }

        }
    }
}

#Preview {
    ContentView()
}
