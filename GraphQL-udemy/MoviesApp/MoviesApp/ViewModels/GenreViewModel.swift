//
//  GenreViewModel.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 17/08/23.
//

import Apollo
import Foundation
import MoviesSchema

struct GenreViewModel: Identifiable, Hashable {
    let id = UUID()
    let name: String

    init(name: String) {
        self.name = name
    }

    static var `default`: GenreViewModel {
        return GenreViewModel(name: "All")
    }

    public static func == (lhs: GenreViewModel, rhs: GenreViewModel) -> Bool {
        return lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
