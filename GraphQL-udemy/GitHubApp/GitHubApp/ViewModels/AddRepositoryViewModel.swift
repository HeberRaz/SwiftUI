//
//  AddRepositoryViewModel.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 12/08/23.
//

import Foundation
import GitHubAppSchema

class AddRepositoryViewModel: ObservableObject {
    var name = ""
    var description: GraphQLNullable<String> = ""
    var visiblity: GraphQLEnum<RepositoryVisibility> = .case(.public)
    @Published var errors = [ErrorViewModel]()

    func saveRepository(completion: @escaping () -> Void) {
        Network.shared.apollo.perform(
            mutation: CreateRepositoryMutation(
                name: name,
                description: description,
                visibility: visiblity,
                clientMutationId: UUID().uuidString
            )
        ) { result in
            switch result {
            case .success(let graphQlResult):
                if let errors = graphQlResult.errors {
                    DispatchQueue.main.async {
                        self.errors = errors.map {
                            ErrorViewModel(message: $0.message)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        completion()
                    }
                }
                print(graphQlResult)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errors = [ErrorViewModel(message: error.localizedDescription)]
                }
            }
        }
    }
}
