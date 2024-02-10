//
//  PosterViewModel.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 20/12/23.
//

import Foundation

struct PosterViewModel {
    let movie: Movie
    let id = UUID()

    var title: String {
        movie.title
    }

    var poster: String {
        movie.poster
    }
}
