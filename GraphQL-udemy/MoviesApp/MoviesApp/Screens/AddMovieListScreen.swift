//
//  AddMovieListScreen.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 16/08/23.
//

import SwiftUI
import Combine

struct MovieListScreen: View {
    @StateObject private var viewModel = MovieListViewModel()
    @State private var isPresented: Bool = false

    var body: some View {
        VStack {
            GenreSelectionView { genreSelectionViewModel in
            }
            Spacer()
            // Show List of Movies
            if !viewModel.movies.isEmpty {
                MovieListView(movies: viewModel.movies)
            } else {
                NoResultView(message: "No movies found")
            }
            Spacer()
        }
        .sheet(isPresented: $isPresented, onDismiss: {
        }, content: {
            AddMovieScreen()
        })
        .onAppear(perform: {
            viewModel.getAllMovies()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }, label: {
            Image(systemName: "plus")
        }))
        .navigationTitle("Movies")
        .embedInNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
