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
                    self.movies = movies.compactMap { $0 }.map(MovieViewModel.init)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


