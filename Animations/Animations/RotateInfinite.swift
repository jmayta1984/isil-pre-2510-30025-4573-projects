//
//  RotateInfinite.swift
//  Animations
//
//  Created by Alumno on 27/06/25.
//

import SwiftUI

struct RotateInfinite: View {
    @State var rotate = false
    
    var body: some View {
        VStack {
            Image(systemName: "arrow.2.circlepath")
                .resizable()
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotate ? 360 : 0))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: rotate)
        }
        .onAppear {
            rotate = true
        }
        
        
     
    }
}


#Preview {
    RotateInfinite()
}
