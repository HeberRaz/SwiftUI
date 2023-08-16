//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 16/08/23.
//

import SwiftUI
import MoviesSchema

struct MovieListView: View {
    let movies: [MovieViewModel]
    var onDeleteMovie: ((String) -> Void)?

    private func deleteMovie(at indexSet: IndexSet) {
    }

    var body: some View {
        List {
            ForEach(movies, id: \.id) { movie in
                HStack {
                    URLImage(url: movie.poster)
                        .frame(width: 100, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .padding(.top, 10)
                            .font(.headline)
                        Text(movie.year)
                            .font(.caption)

                        HStack {
                            Text(movie.genre)
                                .font(.caption)
                                .foregroundColor(.black)
                                .padding(8)

                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )

                        Spacer()
                    }
                }
            }.onDelete(perform: deleteMovie)
        }
        .listStyle(PlainListStyle())
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: [])
    }
}
