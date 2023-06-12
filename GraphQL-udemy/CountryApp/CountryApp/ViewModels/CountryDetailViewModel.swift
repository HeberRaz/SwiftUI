//
//  CountryDetailViewModel.swift
//  CountryApp
//
//  Created by Heber Alvarez on 30/05/23.
//

import Apollo
import CountryAppSchema
import Foundation

class CountryDetailViewModel: ObservableObject {
    @Published private var country: CountryInfoQuery.Data.Country?

    private let network: CountryDataFetcher

    init(network: CountryDataFetcher) {
        self.network = network
    }

    var name: String {
        country?.name ?? ""
    }

    var capital: String {
        country?.capital ?? ""
    }

    var native: String {
        country?.native ?? ""
    }

    var states: [StateViewModel] {
        country?.states.map(StateViewModel.init) ?? []
    }

    func getCountryDetailsBy(code: ID) {
        network.retreiveCountryDetailsBy(code: code) { response in
            switch response {
            case .success(let countryInfo):
                self.country = countryInfo
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}


struct StateViewModel: Identifiable {
    let state: CountryInfoQuery.Data.Country.State

    let id = UUID()

    var name: String {
        state.name
    }
}
