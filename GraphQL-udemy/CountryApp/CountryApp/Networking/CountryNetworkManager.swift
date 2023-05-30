//
//  CountryNetworkManager.swift
//  CountryApp
//
//  Created by Heber Alvarez on 27/05/23.
//

import Apollo
import CountryAppSchema

protocol CountryDataFetcher {
    func retrieveAllCountries(completion: @escaping (AllCountriesQueryResponse) -> Void)
}

enum AllCountriesQueryResponse {
    case success([AllCountriesQuery.Data.Country])
    case failure(Error)
}

struct CountryNetworkManager: CountryDataFetcher {
    func retrieveAllCountries(completion: @escaping (AllCountriesQueryResponse) -> Void) {
        Network.shared.apollo.fetch(query: AllCountriesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let countries = graphQLResult.data?.countries {
                    completion(.success(countries))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
