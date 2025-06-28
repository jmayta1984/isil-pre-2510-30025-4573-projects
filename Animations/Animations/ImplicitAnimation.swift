//
//  ImplicitAnimation.swift
//  Animations
//
//  Created by Alumno on 27/06/25.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State var isBig = false
    
    var body: some View {
        VStack {
            
            Circle()
                .fill(isBig ? .red : .blue )
                .frame(width: isBig ? 200 : 100,
                       height: isBig ? 200 : 100)
                .offset(x: isBig ? 100 : 0)
                .animation(.bouncy(duration: 2), value: isBig)
                .onTapGesture {
                    isBig.toggle()
                }
        }
    }
}

#Preview {
    ImplicitAnimation()
}
