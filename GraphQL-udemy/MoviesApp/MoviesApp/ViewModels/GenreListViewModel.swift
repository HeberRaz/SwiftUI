//
//  GenreListViewModel.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 17/08/23.
//

import Foundation
import MoviesSchema
import Apollo

final class GenreListViewModel: ObservableObject {
    @Published var genres = [GenreViewModel]()

    func getAllGenres() {
        Network.shared.apollo.fetch(query: AllGenresQuery()) { [weak self] result in
            switch result {
            case .success(let graphQlResult):
                guard let data = graphQlResult.data,
                      let genres = data.genres
                else { return }
                DispatchQueue.main.async {
                    for genre in genres {
                        guard let safeGenre = genre else { return }
                        self?.genres.append(GenreViewModel(name: safeGenre.name))
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
