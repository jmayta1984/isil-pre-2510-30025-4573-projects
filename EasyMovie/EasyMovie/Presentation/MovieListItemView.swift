//
//  MovieListItemView.swift
//  EasyMovie
//
//  Created by Alumno on 4/07/25.
//

import SwiftUI

struct MovieListItemView: View {
    let movie: Movie
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.poster)) { phase in
                switch phase {
                case .empty:
                    EmptyView()
                case .success(let image):
                    image.resizable()
                        .scaledToFit()
                        .frame(height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .failure(let error):
                    Text(error.localizedDescription)
                @unknown default:
                    EmptyView()
                }
            }
            Text(movie.title)
        }
    }
}
