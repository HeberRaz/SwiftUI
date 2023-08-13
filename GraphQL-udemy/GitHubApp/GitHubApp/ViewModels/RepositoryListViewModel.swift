//
//  RepositoryListViewModel.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 12/08/23.
//

import GitHubAppSchema
import Foundation
import Apollo

typealias Node = AllRepositoriesByUsernameQuery.Data.User.Repositories.Node

class RepositoryListViewModel: ObservableObject {
    @Published var repositories = [RepositoryViewModel]()

    func getLatestRepositoriesFor(username: String) {
        Network.shared.apollo.fetch(query: AllRepositoriesByUsernameQuery(username: username)) { result in
            switch result {
            case .success(let graphQlResult):
                print("success", graphQlResult)
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
