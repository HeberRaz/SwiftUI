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
    let onSelected: (GenreViewModel) -> Void
    var body: some View {
        Picker("Select", selection: $selectedGenre) {
            ForEach(genreListViewModel.genres, id: \.id) { genre in
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

struct GenreSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectionView(onSelected: { _ in })
    }
}
