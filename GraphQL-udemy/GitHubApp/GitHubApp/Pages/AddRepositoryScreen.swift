//
//  AddRepositoryScreen.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 12/08/23.
//

import GitHubAppSchema
import SwiftUI
import Combine

struct AddRepositoryScreen: View {
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AddRepositoryViewModel()

    @State private var name = ""
    @State private var description = ""
    @State private var visibility = "public"

    var body: some View {
        Form {
            TextField("Name", text: $viewModel.name)
            TextField("Description", text: $viewModel.description)

            Picker("Select", selection: $viewModel.visiblity) {
                Text("Public").tag(RepositoryVisibility.public)
                Text("Private").tag(RepositoryVisibility.private)
            }
            .pickerStyle(.segmented)

            HStack {
                Spacer()
                Button("Save") {
                    viewModel.saveRepository {
                        self.dismiss()
                    }
                }
                Spacer()
            }
        }
        .navigationTitle("Add Repository")
    }
}

struct AddRepositoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddRepositoryScreen()
    }
}
