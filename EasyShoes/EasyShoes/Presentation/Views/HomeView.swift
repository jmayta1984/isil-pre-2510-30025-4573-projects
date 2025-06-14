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
    
    @StateObject var viewModel = HomeViewModel()
    
    @State var selectedShoe: Shoe? = nil
    
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
                
                switch viewModel.uiState {
                case .initialState, .loadingState:
                    ProgressView()
                case .successState(let shoes):
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(shoes) { shoe in
                            ShoeCardView(shoe: shoe)
                                .onTapGesture {
                                    selectedShoe = shoe
                                }
                        }
                    }
                case .failureState(let message):
                    Text(message)
                }
            }
            .padding()
            .onAppear {
                viewModel.getShoes()
            }
        }
        .scrollIndicators(.hidden)
        .sheet(item: $selectedShoe) { shoe in
            ShoeDetailView(shoe: shoe) {
                viewModel.getShoes()
            }
        }
        
    }
}

#Preview {
    HomeView()
}
