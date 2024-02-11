//
//  AddMovieScreen.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 16/08/23.
//

import SwiftUI

struct AddMovieScreen: View {
    @StateObject var addMovieViewModel = AddMovieViewModel()
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        Form {
            TextField("Name", text: $addMovieViewModel.name, onEditingChanged: { _ in }) {
                addMovieViewModel.fetchPosterByMovie(name: addMovieViewModel.name.encoded())
            }
            TextField("Year", text: $addMovieViewModel.year)
            GenreSelectionView(ignoredGenres: ["All"]) { genreViewModel in
                addMovieViewModel.genre = genreViewModel.name
            }
            MoviePosterGridView(posters: addMovieViewModel.posters, selectedPoster: $addMovieViewModel.poster)
        }
        .navigationTitle("Add New Movie")
        .navigationBarItems(trailing: Button("Save") {
            addMovieViewModel.addMovie {
                presentationMode.wrappedValue.dismiss()
            }
        })
        .embedInNavigationView()
    }
}

struct AddMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieScreen()
    }
}
