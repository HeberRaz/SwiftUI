//
//  Query+Extensions.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 13/08/23.
//

import Apollo
import Foundation
import GitHubAppSchema

extension AllRepositoriesByUsernameQuery.Data.User.Repositories.Node: RepositoryNode {}

extension TopRepositoriesForUsernameQuery.Data.User.Repositories.Node: RepositoryNode {}
