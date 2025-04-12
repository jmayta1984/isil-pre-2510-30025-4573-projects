//
//  ProfileCard.swift
//  Demo
//
//  Created by Alumno on 11/04/25.
//

import SwiftUI

struct ProfileCard: View {
    var body: some View {
        VStack (alignment: .center, spacing: 16){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.blue)
            Text("Jorge Mayta")
                .font(.title)
                .bold()
            Text("Docente de ISIL")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 8)
    }
}

#Preview {
    ProfileCard()
}
