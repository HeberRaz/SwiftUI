//
//  Network.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 16/08/23.
//

import Foundation
import Apollo

class Network {
    let localHost = "http://localhost:4000"
    static let shared: Network = Network()

    private init() { }

    lazy var apollo = ApolloClient(url: URL(string: localHost)!)
}
