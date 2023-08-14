//
//  RepositoryNode.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 13/08/23.
//

import Foundation
import GitHubAppSchema
import Apollo

protocol RepositoryNode {
    var id: ID { get }
    var name: String { get }
    var description: String? { get }
    var stargazerCount: Int { get }
}
