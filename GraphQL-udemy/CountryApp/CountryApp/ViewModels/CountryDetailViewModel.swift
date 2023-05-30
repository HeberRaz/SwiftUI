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

    var name: String {
        country?.name ?? ""
    }

    var capital: String {
        country?.capital ?? ""
    }

    var states: [StateViewModel] {
        country?.states.map(StateViewModel.init) ?? []
    }

    func getCountryDetailsBy(code: ID) {
        Network.shared.apollo.fetch(query: CountryInfoQuery(code: code)) { result in
            switch result {
            case .success(let graphQLResult):
                DispatchQueue.main.async {
                    self.country = graphQLResult.data?.country
                }
            case .failure(let error):
                fatalError("Error \(error)")
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
