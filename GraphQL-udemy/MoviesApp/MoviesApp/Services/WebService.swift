//
//  WebService.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 20/12/23.
//

import Foundation
typealias MovieResult = Result<[Movie], NetworkError>
class WebService {
    func getMovieBy(name: String, completion: @escaping (MovieResult) -> Void) {
        guard let url = Constant.Urls.urlByMovieName(name: name) else {
            return completion(.failure(.badUrl))
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data, error == nil else {
                completion(.failure(.noData))
                return
            }
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let movieResponse {
                completion(.success(movieResponse.movies))
            } else {
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}
