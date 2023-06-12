//
//  CountryNetworkManager.swift
//  CountryApp
//
//  Created by Heber Alvarez on 27/05/23.
//

import Apollo
import Foundation
import CountryAppSchema

protocol CountryDataFetcher {
    func retrieveAllCountries(completion: @escaping (QueryArrayResponse<AllCountriesQuery.Data.Country>) -> Void)
    func retreiveCountryDetailsBy(
        code: ID,
        completion: @escaping (QueryResponse<CountryInfoQuery.Data.Country>) -> Void
    )
}

enum QueryArrayResponse<T: CountryAppSchema.SelectionSet> {
    case success([T])
    case failure(Error)
}

enum QueryResponse<T: CountryAppSchema.SelectionSet> {
    case success(T)
    case failure(Error)
}

struct CountryNetworkManager: CountryDataFetcher {
    func retrieveAllCountries(completion: @escaping (QueryArrayResponse<AllCountriesQuery.Data.Country>) -> Void) {
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

    func retreiveCountryDetailsBy(
        code: ID,
        completion: @escaping (QueryResponse<CountryInfoQuery.Data.Country>) -> Void
    ) {
        Network.shared.apollo.fetch(query: CountryInfoQuery(code: code)) { result in
            switch result {
            case .success(let graphQLResult):
                guard let countryInfo = graphQLResult.data?.country else {
                    return completion(.failure(NSError(domain: "Data.Country was not obtained from graphql result", code: 402)))
                }
                completion(.success(countryInfo))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
