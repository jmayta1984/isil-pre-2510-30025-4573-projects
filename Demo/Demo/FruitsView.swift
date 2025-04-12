//
//  FruitsView.swift
//  Demo
//
//  Created by Alumno on 11/04/25.
//

import SwiftUI

struct FruitsView: View {
    
    @State var input = ""
    
    var body: some View {
        NavigationStack{
            
            Text("Input: \(input)")

            NavigationLink(destination: {
                InputView(input: $input)
            }) {
                Text("Next")
            }
            
        }
    }
}

struct InputView: View {
    
    @Binding  var input: String
    var body: some View {
        VStack {
            TextField("Input", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

        }
    }
}

#Preview {
    FruitsView()
}
