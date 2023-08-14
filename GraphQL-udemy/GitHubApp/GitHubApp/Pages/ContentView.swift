//
//  ContentView.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 10/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var repositoriesDisplay: String = "latest"
    @State private var isPresented: Bool = false
    @StateObject private var repositoryListViewModel = RepositoryListViewModel()

    // MARK: Private views
    @ViewBuilder private var picker: some View {
        Picker("Select", selection: $repositoriesDisplay) {
            Text("Latest").tag("latest")
            Text("Top").tag("top")
        }
        .pickerStyle(.segmented)
    }

    @ViewBuilder private var list: some View {
        List(repositoryListViewModel.repositories, id: \.id) { repository in
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(repository.name)
                        .font(.headline)
                    Text(repository.description)
                }
                Spacer()

                if repository.hasRating {
                    HStack {
                        Text("\(repository.starCount)")
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
        .listStyle(.plain)
    }

    var body: some View {
        NavigationView {
            VStack {
                picker
                list
            }
            .padding()
            .onAppear {
                repositoryListViewModel.getLatestRepositoriesFor(username: Constant.User.username)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(
                        action: {
                            isPresented = true
                        }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                repositoryListViewModel.getLatestRepositoriesFor(username: Constant.User.username)
            }, content: {
                AddRepositoryScreen()
            })
            .navigationTitle("Repositories")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
