//
//  MovieViewModel.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 16/08/23.
//

import Foundation
import Apollo
import MoviesSchema

struct MovieViewModel {
    let movie: AllMoviesQuery.Data.Movie

    var id: ID {
        movie.id
    }

    var title: String {
        movie.title
    }

    var year: String {
        movie.year
    }

    var genre: String {
        movie.genre
    }

    var poster: String {
        movie.poster
    }
}
