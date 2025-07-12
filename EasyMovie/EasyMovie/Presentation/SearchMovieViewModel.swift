//
//  MovieListViewModel.swift
//  EasyMovie
//
//  Created by Alumno on 4/07/25.
//

import Foundation

class SearchMovieViewModel: ObservableObject {
    @Published var uiState: UIState<[Movie]> = .initialState
    @Published var query: String = ""
    
    func searchMovies() {
        uiState = .loadingState
        
        let movieService = MovieService.shared
        
        movieService.searchMovies(query: query) { movies, errorMessage in
            DispatchQueue.main.async {
                if let movies = movies {
                    self.uiState = .successState(movies)
                } else {
                    self.uiState = .failureState(errorMessage ?? "Unknown error")
                }
            }
        }
        
    }
}
