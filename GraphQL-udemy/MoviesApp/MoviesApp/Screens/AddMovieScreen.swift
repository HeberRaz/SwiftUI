//
//  AddMovieScreen.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 16/08/23.
//

import SwiftUI

struct AddMovieScreen: View {
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        Form {
            Text("TextField For the Name")
            Text("TextField For the Year")
            Text("Picker For the Genre Selection")
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
