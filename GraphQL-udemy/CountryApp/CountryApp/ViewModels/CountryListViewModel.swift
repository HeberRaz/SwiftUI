//
//  CountryListViewModel.swift
//  CountryApp
//
//  Created by Heber Alvarez on 27/05/23.
//

import CountryAppSchema
import Apollo
import Foundation

class CountryListViewModel: ObservableObject {
    private let network: CountryDataFetcher
    
    @Published var countries = [CountryViewModel]()

    init(network: CountryDataFetcher) {
        self.network = network
    }

    func getAllCountries() {
        network.retrieveAllCountries { response in
            switch response {
            case .success(let countries):
                self.countries = countries.map(CountryViewModel.init)
            case .failure(let error):
                print(error)
            }
        }
    }
}
