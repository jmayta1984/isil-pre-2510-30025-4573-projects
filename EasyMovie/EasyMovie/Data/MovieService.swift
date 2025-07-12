//
//  MovieService.swift
//  EasyMovie
//
//  Created by Alumno on 11/07/25.
//

import Foundation

class MovieService {
    private let baseUrl = "https://api.themoviedb.org/3/search/movie"
    
    static let shared = MovieService()
    
    private init() {}
    
    func searchMovies(query: String, completion: @escaping([Movie]?, String?) -> Void) {
        guard var components = URLComponents(string: baseUrl) else {
            completion(nil, "Error: invalid base URL")
            return
        }
        components.queryItems = [
            URLQueryItem(name: "api_key", value: "0fb2259dc60130bd85acb07069f8bb0d"),
            URLQueryItem(name: "query", value: query)
        ]
        
        guard let url = components.url else {
            completion(nil, "Error: invalid URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(nil, "Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            guard let data = data else {
                completion(nil, "Error: no data found")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Error: HTTP request failed")
                return
            }
            
            do {
                let moviesDTO = try JSONDecoder().decode(MoviesDTO.self, from: data)
                let dtos = moviesDTO.movies
                let movies = dtos.map { $0.toDomain() }
                completion(movies, nil)
            } catch let error {
                completion(nil, "Error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
        
        
    }
    
}
