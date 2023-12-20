//
//  Constant.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 16/08/23.
//

import Foundation

struct Constant {
    struct Keys {
        static let apiKey = "c454be77"
    }

    struct Urls {
        static func urlByMovieName(name: String) -> URL? {
            return URL(string: "http://www.omdbapi.com/?s=\(name)&page=2&apikey=\(Keys.apiKey)")
        }
    }
}
