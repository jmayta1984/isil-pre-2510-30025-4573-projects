//
//  MovieDetailView.swift
//  EasyMovie
//
//  Created by Alumno on 4/07/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack (alignment: .bottomTrailing){
                AsyncImage(url: URL(string: movie.poster)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                    case .failure(let error):
                        Text(error.localizedDescription)
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                    @unknown default:
                        EmptyView()
                    }
                }
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                        .foregroundStyle(.black)
                        .background(.white)
                        .clipShape(Circle())
                        .padding()
                }

            }
            VStack (alignment: .leading){
                Text(movie.title)
                    .font(.title)
                Text(movie.overview)
                    .font(.subheadline)
            }
            .padding()
           
            Spacer()
        }
    }
}
