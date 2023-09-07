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
    let id: ID
    let title: String
    let year: String
    let genre: String
    let poster: String

    init(id: ID, title: String, year: String, genre: String, poster: String) {
        self.id = id
        self.title = title
        self.year = year
        self.genre = genre
        self.poster = poster
    }
}

struct MovieViewModel2 {
    let movie: AllMoviesQuery.Data.Movie

    var genre: String {
        movie.genre
    }
}
