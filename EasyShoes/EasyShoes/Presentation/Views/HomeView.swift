//
//  HomeView.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    @State var selectedGender = "All"
    let genders = ["All", "Men", "Women", "Kids"]
    
    @State var shoes = [Shoe]()
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20){
                
                Search(search: $search)
                
                Banner()
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(genders, id: \.self) { gender in
                            Text(gender)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .foregroundStyle(selectedGender == gender ? .white : .gray)
                                .background(selectedGender == gender ? Color.primaryColor : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(selectedGender == gender ? Color.primaryColor : .gray, lineWidth: 1)
                                }
                                .onTapGesture {
                                    selectedGender = gender
                                }
                        }
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(shoes) { shoe in
                        ShoeCardView(shoe: shoe)
                    }
                }
                Spacer()
            }
            .padding()
            .onAppear {
                shoes = loadShoesFromJson()
            }
        }
        
    }
}

#Preview {
    HomeView()
}
