//
//  NetworkError.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 20/12/23.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}
