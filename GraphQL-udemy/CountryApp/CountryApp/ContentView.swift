//
//  ContentView.swift
//  CountryApp
//
//  Created by Heber Alvarez on 23/05/23.
//

import SwiftUI
import CountryAppSchema

struct ContentView: View {
    @State private var countries = [AllCountriesQuery.Data.Country]()

    @ViewBuilder
    private var countriesList: some View {
        List(countries, id: \.code) { country in
            NavigationLink(
                destination: CountryDetailView(countryCode: country.code)) {
                    HStack {
                        Text(country.emoji)
                        Text(country.name)
                    }
                }
        }
        .listStyle(.plain)
        .onAppear {
            fetchCountries()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                countriesList
            }
            .navigationTitle("Countries")
        }
    }

    // MARK: - Private methods
    private func fetchCountries() {
        Network.shared.apollo.fetch(query: AllCountriesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let countries = graphQLResult.data?.countries {
                    DispatchQueue.main.async {
                        self.countries = countries
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
