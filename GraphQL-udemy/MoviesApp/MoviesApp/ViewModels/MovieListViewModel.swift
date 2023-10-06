//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 16/08/23.
//

import Foundation
import Apollo
import MoviesSchema

class MovieListViewModel: ObservableObject {
    @Published var movies = [MovieViewModel]()

    func getAllMovies() {
        Network.shared.apollo.fetch(query: AllMoviesQuery()) { result in
            switch result {
            case .success(let graphQlResult):
                guard let data = graphQlResult.data,
                      let movies = data.movies
                else { return }
                DispatchQueue.main.async {
                    for movie in movies {
                        guard let safeMovie = movie else { return }

                        self.movies.append(
                            MovieViewModel(
                                id: safeMovie.id,
                                title: safeMovie.title,
                                year: safeMovie.year,
                                genre: safeMovie.genre,
                                poster: safeMovie.poster
                            )
                        )
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
