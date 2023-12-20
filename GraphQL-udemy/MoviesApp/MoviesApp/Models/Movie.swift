//
//  Movie.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 20/12/23.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let year: String
    let poster: String
    let imdbId: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case imdbId = "imdbID"
    }
}
