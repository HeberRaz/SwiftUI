//
//  MovieResponse.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 20/12/23.
//

import Foundation
struct MovieResponse: Decodable {
    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}
