//
//  WeatherNetwork.swift
//  MyWeatherApp
//
//  Created by Heber Alvarez on 12/06/23.
//

import Foundation
import Apollo

final class Network {
    static let shared = Network()
    private init() { }

    lazy var apollo = ApolloClient(url: URL(string: "https://weathermachine.io/graphql")!)
}
