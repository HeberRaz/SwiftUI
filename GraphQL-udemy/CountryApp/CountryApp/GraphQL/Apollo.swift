//
//  Apollo.swift
//  CountryApp
//
//  Created by Heber Alvarez on 25/05/23.
//

import Foundation
import Apollo

final class Network {
    static var shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com")!)

    private init() {}
}
