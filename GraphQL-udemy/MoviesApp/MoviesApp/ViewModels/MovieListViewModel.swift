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

    func deleteMovie(movieId: String) {
        Network.shared.apollo.perform(mutation: DeleteMovieMutation(movieToDelete: movieId)) { [weak self] result in
            switch result {
            case .success(let graphQlResult):
                self?.getAllMovies()
                print(graphQlResult)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getAllMovies(genre: String? = nil) {
        var nullableGenre: GraphQLNullable<String> {
            if let genre {
                return .some(genre)
            }
            return .null
        }
        Network.shared.apollo.fetch(query: AllMoviesQuery(genre: nullableGenre), cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let graphQlResult):
                guard let data = graphQlResult.data,
                      let movies = data.movies
                else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.movies = []
                    for movie in movies {
                        guard let safeMovie = movie else { return }

                        self?.movies.append(
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
