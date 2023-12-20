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
    @Published var poster: String = ""
    var genre: String = ""

    func addMovie(completion: @escaping () -> Void) {
        let movie = MovieInput(title: name, year: year, genre: genre, poster: poster)
        let nullableMovie: GraphQLNullable<MovieInput> = .some(movie)
        Network.shared.apollo.perform(mutation: CreateMovieMutation(movie: nullableMovie)) { result in
            switch result {
            case .success(let graphQLResult):
                completion()
            case .failure(let error):
                print("AddMovieError", error)
            }
        }
    }
}
