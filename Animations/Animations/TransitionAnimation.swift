//
//  TransitionAnimation.swift
//  Animations
//
//  Created by Alumno on 27/06/25.
//

import SwiftUI

struct TransitionAnimation: View {
    
    @State var show = false
    var body: some View {
        VStack {
            if show {
                Rectangle()
                    .transition(.scale.combined(with: .opacity))
                    .animation(.easeInOut, value: show)
                    .frame(width: 100, height: 200)
            }
            
            Button {
                withAnimation {
                    show.toggle()
                }

                
            } label: {
                Text("Show")
            }

        }
    }
}

#Preview {
    TransitionAnimation()
}
