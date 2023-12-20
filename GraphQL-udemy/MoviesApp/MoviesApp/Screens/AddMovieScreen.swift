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
                // TODO: Heber perform a REST API request to get the posters
            }
            TextField("Year", text: $addMovieViewModel.year)
            GenreSelectionView { genreViewModel in
                
            }
            Text("Show Movie Posters in Grid")
        }
        .navigationTitle("Add New Movie")
        .navigationBarItems(trailing: Button("Save") {
        })
        .embedInNavigationView()
    }
}

struct AddMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieScreen()
    }
}
