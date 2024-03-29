//
//  RepositoryListViewModel.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 12/08/23.
//

import GitHubAppSchema
import Foundation
import Apollo

class RepositoryListViewModel: ObservableObject {
    @Published var repositories = [RepositoryViewModel]()
    @Published var repositoryDisplay: RepositoryDisplay = .latest

    func getLatestRepositoriesFor(username: String) {
        Network.shared.apollo.fetch(
            query: AllRepositoriesByUsernameQuery(username: username, last: 10),
            cachePolicy: .fetchIgnoringCacheData
        ) { result in
            switch result {
            case .success(let graphQlResult):
                guard let data = graphQlResult.data,
                      let user = data.user,
                      let nodes = user.repositories.nodes
                else { return }
                DispatchQueue.main.async {
                    self.repositories = nodes.compactMap { $0 }.map(RepositoryViewModel.init)
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }

    func getTopRepositoriesFor(username: String) {
        Network.shared.apollo.fetch(query: TopRepositoriesForUsernameQuery(username: username, first: 5)) { result in
            switch result {
            case .success(let graphQlResult):
                guard let data = graphQlResult.data,
                      let user = data.user,
                      let nodes = user.repositories.nodes
                else { return }
                DispatchQueue.main.async {
                    self.repositories = nodes.compactMap { $0 }.map(RepositoryViewModel.init)
                }
            case .failure(let error):
                print("error", error)
            }

        }
    }
}
