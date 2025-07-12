//
//  MovieDTO.swift
//  EasyMovie
//
//  Created by Alumno on 11/07/25.
//


struct MoviesDTO: Decodable {
    let movies: [MovieDTO]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct MovieDTO: Decodable {
    
    let id: Int
    let title: String
    let poster: String?
    let popularity: Double
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
        case popularity
        case overview
    }
    
    func toDomain() -> Movie {
        Movie(id: id,
              title: title,
              poster: poster.map({ "https://image.tmdb.org/t/p/w500\($0)"}) ?? "",
              popularity: popularity)
    }
}
