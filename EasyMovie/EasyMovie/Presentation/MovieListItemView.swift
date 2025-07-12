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
                    ProgressView()
                        .frame(width: 120, height: 160)
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                case .failure(let error):
                    Text(error.localizedDescription)
                        .frame(width: 120, height: 160)
                @unknown default:
                    EmptyView()
                }
            }
            Text(movie.title)
        }
    }
}
