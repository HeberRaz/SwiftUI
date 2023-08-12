//
//  RepositoryViewModel.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 12/08/23.
//

import GitHubAppSchema
import Foundation

struct RepositoryViewModel {
    let node: Node

    var id: ID {
        node.id
    }

    var hasRating: Bool {
        node.stargazerCount > 0
    }

    var name: String {
        node.name
    }

    var description: String {
        node.description ?? ""
    }

    var starCount: Int {
        node.stargazerCount
    }
}
