//
//  AddMovieViewModel.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 20/12/23.
//

import Foundation
import MoviesSchema

class AddMovieViewModel: ObservableObject {
    var name: String = ""
    var year: String = ""
    @Published var posters = [PosterViewModel]()
    @Published var poster: String = ""
    var genre: String = ""

    func addMovie(completion: @escaping () -> Void) {
        let movie = MovieInput(title: name, year: year, genre: genre, poster: poster)
        let nullableMovie: GraphQLNullable<MovieInput> = .some(movie)
        Network.shared.apollo.perform(mutation: CreateMovieMutation(movie: nullableMovie)) { result in
            switch result {
            case .success(_):
                completion()
            case .failure(let error):
                print("AddMovieError", error)
            }
        }
    }

    func fetchPosterByMovie(name: String) {
        WebService().getMovieBy(name: name) { [weak self] result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self?.posters = movies.map(PosterViewModel.init)
                }
            case .failure(let error):
                print("Poster Error", error)
            }
        }
    }
}
