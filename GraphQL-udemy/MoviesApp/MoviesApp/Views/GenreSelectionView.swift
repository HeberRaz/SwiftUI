//
//  GenreSelectionView.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 19/12/23.
//

import SwiftUI

struct GenreSelectionView: View {
    @State private var selectedGenre: GenreViewModel = GenreViewModel.default
    @StateObject private var genreListViewModel: GenreListViewModel = GenreListViewModel()
    var ignoredGenres: [String]?
    let onSelected: (GenreViewModel) -> Void
    var body: some View {
        Picker("Select", selection: $selectedGenre) {
            ForEach(prepareGenres(), id: \.id) { genre in
                Text(genre.name).tag(genre)
            }
        }
        .pickerStyle(.segmented)
        .onAppear {
            genreListViewModel.getAllGenres()
        }
        .onChange(of: selectedGenre) { value in
            onSelected(value)
        }
    }
}

// MARK: - Helper functions
extension GenreSelectionView {
    func prepareGenres() -> [GenreViewModel] {
        guard let ignoredGenres = ignoredGenres else { return genreListViewModel.genres }
        return genreListViewModel.genres.filter { genre in
            !ignoredGenres.contains(genre.name)
        }
    }
}

struct GenreSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectionView(onSelected: { _ in })
    }
}
