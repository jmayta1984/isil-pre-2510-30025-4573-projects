//
//  SearchMovieView.swift
//  EasyMovie
//
//  Created by Alumno on 4/07/25.
//

import SwiftUI

struct SearchMovieView: View {
    
    @StateObject var viewModel = MovieListViewModel()
    @State var query = ""
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Search", text: $query)
                    .onSubmit {
                        viewModel.searchMovies(query: query)
                    }
            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
            
            switch viewModel.uiState {
            case .initialState:
                Spacer()
            case .loadingState:
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                
            case .successState(let movies):
                List {
                    ForEach(movies) { movie in
                        MovieListItemView(movie: movie)
                    }
                }
                .listStyle(.plain)
            case .failureState(let message):
                Text(message)
            }
        }
    }
}

#Preview {
    SearchMovieView()
}
