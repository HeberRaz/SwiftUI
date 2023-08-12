//
//  Network.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 12/08/23.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()

    private init() {}

    private(set) lazy var apollo: ApolloClient = {
        let url = URL(string: "https://api.github.com/graphql")!
        let configuration = URLSessionConfiguration.default
        let store = ApolloStore()
        configuration.httpAdditionalHeaders = ["authorization": "Bearer \(Constant.APIKey.gitHubAccessToken)"]
        let sessionClient = URLSessionClient(sessionConfiguration: configuration)
        let provider = DefaultInterceptorProvider(client: sessionClient, shouldInvalidateClientOnDeinit: true, store: store)
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        return ApolloClient(networkTransport: networkTransport, store: store)
    }()
}
