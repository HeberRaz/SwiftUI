//
//  ContentView.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 10/07/23.
//

import Combine
import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @State private var cancellable: AnyCancellable?
    @StateObject private var repositoryListViewModel = RepositoryListViewModel()

    // MARK: Private views
    @ViewBuilder private var picker: some View {
        Picker("Select", selection: $repositoryListViewModel.repositoryDisplay) {
            Text("Latest").tag(RepositoryDisplay.latest)
            Text("Top").tag(RepositoryDisplay.top)
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
                self.cancellable = repositoryListViewModel.$repositoryDisplay.sink { display in
                    switch display {
                    case .top:
                        repositoryListViewModel.getTopRepositoriesFor(username: Constant.User.username)
                    case .latest:
                        repositoryListViewModel.getLatestRepositoriesFor(username: Constant.User.username)
                    }
                }
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
