//
//  MovieListViewModel.swift
//  EasyMovie
//
//  Created by Alumno on 4/07/25.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var uiState: UIState<[Movie]> = .initialState
    
    func searchMovies(query: String) {
        uiState = .loadingState
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.uiState = .successState([
                Movie(id: 1, title: "Batman Forever", poster: "https://image.tmdb.org/t/p/w500/l0wdmQl9TDhMgz1f822yjXHdtlf.jpg", popularity: 7.5)
            ])
        }
    }
}
